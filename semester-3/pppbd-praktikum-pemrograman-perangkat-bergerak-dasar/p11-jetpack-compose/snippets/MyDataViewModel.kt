package com.example.mycomposeapp

import android.app.Application
import android.content.Context
import androidx.core.content.edit
import androidx.lifecycle.AndroidViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

data class MyData(
    val name: String = "John Doe",
    val age: String = "32"
)

class MyDataViewModel(application: Application) : AndroidViewModel(application) {
    companion object {
        private const val PREFS_NAME = "my_data_prefs"
        private const val KEY_NAME = "name"
        private const val KEY_AGE = "age"
    }

    private val prefs = application.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    private val _uiState = MutableStateFlow(
        MyData(
            name = prefs.getString(KEY_NAME, null) ?: "John Doe",
            age = prefs.getString(KEY_AGE, null) ?: "32"
        )
    )
    val uiState: StateFlow<MyData> = _uiState.asStateFlow()

    fun onNameChange(newName: String) {
        updateState(_uiState.value.copy(name = newName))
    }

    fun onAgeChange(newAge: String) {
        updateState(_uiState.value.copy(age = newAge))
    }

    private fun updateState(newState: MyData) {
        _uiState.value = newState
        prefs.edit {
            putString(KEY_NAME, newState.name)
            putString(KEY_AGE, newState.age)
        }
    }
}