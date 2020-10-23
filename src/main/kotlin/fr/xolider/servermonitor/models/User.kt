package fr.xolider.servermonitor.models

interface User {

    val id: Int
    val username: String
    val password: String
    val isAdmin: Boolean
}