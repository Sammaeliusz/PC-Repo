package com.example.wkgp

import org.springframework.boot.fromApplication
import org.springframework.boot.with


fun main(args: Array<String>) {
    fromApplication<WkgpApplication>().with(TestcontainersConfiguration::class).run(*args)
}
