import static javax.naming.Context.SECURITY_AUTHENTICATION;

public class Cls {

    public void ldapBind(Environment env) {
        // ruleid:anonymous-ldap-bind
        env.put(Context.SECURITY_AUTHENTICATION, "none");
        DirContext ctx = new InitialDirContext(env);
    }

    public void ldapBindSafe(Environment env) {
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        DirContext ctx = new InitialDirContext(env);
    }

    // Environment built in a helper method, context created elsewhere
    private static Properties getJndiAuthenticationProperties(String bindDn, String bindPassword) {
        Properties props = new Properties();
        if (bindDn == null) {
            // ruleid:anonymous-ldap-bind
            props.put(Context.SECURITY_AUTHENTICATION, "none");
        } else {
            props.put(Context.SECURITY_AUTHENTICATION, "simple");
            props.put(Context.SECURITY_PRINCIPAL, bindDn);
            props.put(Context.SECURITY_CREDENTIALS, bindPassword);
        }
        return props;
    }

    public DirContext connect(String bindDn, String bindPassword) throws NamingException {
        return new InitialDirContext(getJndiAuthenticationProperties(bindDn, bindPassword));
    }

    public Hashtable<String, String> buildEnv() {
        Hashtable<String, String> env = new Hashtable<>();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        // ruleid:anonymous-ldap-bind
        env.put(javax.naming.Context.SECURITY_AUTHENTICATION, "none");
        return env;
    }

    public Properties propertiesWithSetProperty() {
        Properties props = new Properties();
        // ruleid:anonymous-ldap-bind
        props.setProperty(Context.SECURITY_AUTHENTICATION, "none");
        return props;
    }

    public Properties rawKeyString() {
        Properties props = new Properties();
        // ruleid:anonymous-ldap-bind
        props.setProperty("java.naming.security.authentication", "none");
        return props;
    }

    public Hashtable<String, Object> staticImport() {
        Hashtable<String, Object> env = new Hashtable<>();
        // ruleid:anonymous-ldap-bind
        env.put(SECURITY_AUTHENTICATION, "none");
        return env;
    }

    public Properties authenticatedHelper(String user, String password) {
        Properties props = new Properties();
        // ok:anonymous-ldap-bind
        props.setProperty(Context.SECURITY_AUTHENTICATION, "simple");
        props.setProperty(Context.SECURITY_PRINCIPAL, user);
        props.setProperty(Context.SECURITY_CREDENTIALS, password);
        return props;
    }

    public void unrelatedNone(Map<String, String> settings) {
        // ok:anonymous-ldap-bind
        settings.put(Context.SECURITY_PROTOCOL, "none");
    }
}
