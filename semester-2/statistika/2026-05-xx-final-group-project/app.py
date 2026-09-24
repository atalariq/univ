import streamlit as st
import pandas as pd
import numpy as np
import joblib
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.preprocessing import MultiLabelBinarizer

# Definisi kelas tetap wajib ada agar model bisa di-load
class GenreBinarizer(BaseEstimator, TransformerMixin):
    def __init__(self):
        self.mlb = MultiLabelBinarizer()
    def fit(self, X, y=None):
        return self
    def transform(self, X, y=None):
        genres_list = X.iloc[:, 0].fillna('').astype(str).apply(lambda x: [g.strip() for g in x.split(',') if g.strip()])
        return self.mlb.transform(genres_list)

class StudioTargetEncoder(BaseEstimator, TransformerMixin):
    def __init__(self, min_freq=5, smoothing=10):
        self.min_freq = min_freq; self.smoothing = smoothing
        self.mapping_ = {}; self.global_mean_ = 0
    def fit(self, X, y):
        return self
    def transform(self, X, y=None):
        s_series = X.iloc[:, 0].fillna('Unknown').astype(str).apply(lambda x: [s.strip() for s in x.split(',') if s.strip()])
        def encode(studios):
            if not studios: return self.global_mean_
            return np.mean([self.mapping_.get(s, self.mapping_.get('Other', self.global_mean_)) for s in studios])
        return s_series.apply(encode).values.reshape(-1, 1)

st.set_page_config(page_title='Anime Predictor', page_icon='🎬', layout='centered')
st.title('🎬 Prediksi Rekomendasi Anime')
st.write('Masukkan detail anime untuk melihat probabilitas masuk Top 25% (Recommended).')

@st.cache_resource
def load_model():
    return joblib.load('anime_recommendation_model.joblib')

try:
    model = load_model()
except Exception as e:
    st.error(f'Gagal memuat model: {e}')
    st.stop()

GENRES = ['Action', 'Adventure', 'Comedy', 'Drama', 'Sci-Fi', 'Fantasy', 'Slice of Life', 'Romance', 'Supernatural', 'Mystery', 'Sports', 'Thriller', 'Horror']
STUDIOS = ['Madhouse', 'MAPPA', 'Kyoto Animation', 'Bones', 'Studio Ghibli', 'Wit Studio', 'ufotable', 'Sunrise', 'Toei Animation', 'J.C.Staff', 'Other']
TYPES = ['TV', 'Movie', 'OVA', 'ONA', 'Special']

with st.form('prediction_form'):
    selected_genres = st.multiselect('Pilih Genre', GENRES, default=['Action'])
    selected_studios = st.selectbox('Pilih Studio Utama', STUDIOS)

    col1, col2 = st.columns(2)
    with col1:
        anime_type = st.selectbox('Tipe Rilis', TYPES)
    with col2:
        episodes = st.number_input('Jumlah Episode', min_value=1, max_value=2000, value=12)

    submit_button = st.form_submit_button('Prediksi Sekarang')

if submit_button:
    if not selected_genres:
        st.warning('Pilih minimal satu genre!')
    else:
        input_data = pd.DataFrame({
            'genres': [", ".join(selected_genres)],
            'studios': [selected_studios],
            'type': [anime_type],
            'episodes': [episodes]
        })

        proba = model.predict_proba(input_data)[0][1]
        optimal_threshold = 0.45

        st.divider()
        col_res1, col_res2 = st.columns(2)
        with col_res1:
            st.metric('Probabilitas Sukses', f'{proba * 100:.1f}%')
        with col_res2:
            if proba >= optimal_threshold:
                st.success('✅ RECOMMENDED')
            else:
                st.error('❌ NOT RECOMMENDED')
