package com.example.notes.ui

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.example.notes.data.Note
import com.example.notes.data.NoteDao
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch

class NoteViewModel(private val dao: NoteDao) : ViewModel() {

    val notes: StateFlow<List<Note>> = dao.observeAll()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5_000), emptyList())

    fun save(existing: Note?, title: String, note: String) {
        viewModelScope.launch {
            if (existing == null) {
                dao.insert(Note(title = title, note = note))
            } else {
                dao.update(existing.copy(title = title, note = note))
            }
        }
    }

    fun delete(note: Note) {
        viewModelScope.launch { dao.delete(note) }
    }

    class Factory(private val dao: NoteDao) : ViewModelProvider.Factory {
        @Suppress("UNCHECKED_CAST")
        override fun <T : ViewModel> create(modelClass: Class<T>): T = NoteViewModel(dao) as T
    }
}
