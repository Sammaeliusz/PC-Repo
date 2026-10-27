package com.example.wkgp_front

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform