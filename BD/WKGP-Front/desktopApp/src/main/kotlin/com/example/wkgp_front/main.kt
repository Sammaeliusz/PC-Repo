package com.example.wkgp_front

import androidx.compose.ui.window.Window
import androidx.compose.ui.window.application

fun main() = application {
    Window(
        onCloseRequest = ::exitApplication,
        title = "WKGP-Front",
    ) {
        App()
    }
}