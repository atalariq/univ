package com.example.mycomposeapp

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

data class MyData (
    val name: String = "John Doe",
    val age: String = "32"
)

class MyDataViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(MyData())
    val uiState: StateFlow<MyData> = _uiState.asStateFlow()

    fun onNameChange(newName: String) {
        _uiState.value = _uiState.value.copy(name = newName)
    }

    fun onAgeChange(newAge: String) {
        _uiState.value = _uiState.value.copy(age = newAge)
    }
}