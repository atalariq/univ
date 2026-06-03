def get_translator(language):
    translators = {
        "id": translate_id,
        "en": translate_en,
    }
    fallback_translator = translate_en
    return translators.get(language, fallback_translator)


def translate_id(key):
    messages = {
        "greeting": "Selamat datang di sistem kami!",
        "menu": "1. Lihat Produk\n2. Buat Pesanan\n3. Pembayaran\n4. Keluar",
        "prompt": "Masukkan pilihan Anda: ",
        "thank_you": "Terima kasih telah menggunakan layanan kami.",
        "farewell": "Sampai jumpa!",
    }
    fallback_message = "[Pesan tidak tersedia]"
    return messages.get(key, fallback_message)


def translate_en(key):
    messages = {
        "greeting": "Welcome to our system!",
        "menu": "1. View Products\n2. Place Order\n3. Payment\n4. Exit",
        "prompt": "Enter your choice: ",
        "thank_you": "Thank you for using our service.",
        "farewell": "Goodbye!",
    }
    fallback_message = "[Message not available]"
    return messages.get(key, fallback_message)


if __name__ == "__main__":
    print("Sistem i18n dengan Dispatch Table")
    print("=" * 40)

    languages = ["id", "en"]

    for lang in languages:
        translator = get_translator(lang)
        print(f"\nBahasa: {lang.upper()}")
        print("-" * 30)
        print(translator("greeting"))
        print(translator("menu"))
        print(translator("thank_you"))
        print(translator("farewell"))
