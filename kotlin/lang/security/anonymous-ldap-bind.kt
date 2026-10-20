import javax.naming.Context.SECURITY_AUTHENTICATION

public class Cls {

    public fun ldapBind(env: Environment): Void {
        // ruleid:anonymous-ldap-bind
        env.put(Context.SECURITY_AUTHENTICATION, "none")
        val ctx: DirContext = InitialDirContext(env)
    }

    public fun ldapBindSafe(env: Environment): Void {
        env.put(Context.SECURITY_AUTHENTICATION, "simple")
        var ctx = InitialDirContext(env)
    }

    // Environment built in a helper function, context created elsewhere
    private fun jndiProperties(bindDn: String?, bindPassword: String?): Properties {
        val props = Properties()
        if (bindDn == null) {
            // ruleid:anonymous-ldap-bind
            props.put(Context.SECURITY_AUTHENTICATION, "none")
        } else {
            props.put(Context.SECURITY_AUTHENTICATION, "simple")
            props.put(Context.SECURITY_PRINCIPAL, bindDn)
            props.put(Context.SECURITY_CREDENTIALS, bindPassword)
        }
        return props
    }

    fun connect(bindDn: String?, bindPassword: String?): DirContext {
        return InitialDirContext(jndiProperties(bindDn, bindPassword))
    }

    fun indexedAssignment(): Hashtable<String, String> {
        val env = Hashtable<String, String>()
        // ruleid:anonymous-ldap-bind
        env[Context.SECURITY_AUTHENTICATION] = "none"
        return env
    }

    fun staticImport(): Hashtable<String, String> {
        val env = Hashtable<String, String>()
        // ruleid:anonymous-ldap-bind
        env[SECURITY_AUTHENTICATION] = "none"
        return env
    }

    fun setProperty(): Properties {
        val props = Properties()
        // ruleid:anonymous-ldap-bind
        props.setProperty("java.naming.security.authentication", "none")
        return props
    }

    fun mapLiteral(): Hashtable<String, String> {
        val env = Hashtable(mapOf(
            Context.INITIAL_CONTEXT_FACTORY to "com.sun.jndi.ldap.LdapCtxFactory",
            // ruleid:anonymous-ldap-bind
            Context.SECURITY_AUTHENTICATION to "none"
        ))
        return env
    }

    fun authenticated(user: String, password: String): Hashtable<String, String> {
        val env = Hashtable<String, String>()
        // ok:anonymous-ldap-bind
        env[Context.SECURITY_AUTHENTICATION] = "simple"
        env[Context.SECURITY_PRINCIPAL] = user
        env[Context.SECURITY_CREDENTIALS] = password
        return env
    }

    fun unrelatedNone(settings: MutableMap<String, String>) {
        // ok:anonymous-ldap-bind
        settings[Context.SECURITY_PROTOCOL] = "none"
    }
}
