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
}
