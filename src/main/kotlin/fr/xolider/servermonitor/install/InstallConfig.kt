package fr.xolider.servermonitor.install

class InstallConfig private constructor() {

    private object HOLDER {
        val INSTANCE = InstallConfig()
    }

    companion object {
        val instance: InstallConfig by lazy {HOLDER.INSTANCE}
    }

    val dbCredentials: MutableMap<String, Any> = mutableMapOf()
    val siteCredentials: MutableMap<String, String> = mutableMapOf()

}