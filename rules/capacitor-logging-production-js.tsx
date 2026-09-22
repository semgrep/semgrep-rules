import type { CapacitorConfig } from "@capacitor/cli";

const BadConfig: CapacitorConfig = { 
	appId: 'com.foo.bar',
	appName: 'Foobar App',
    // ruleid: capacitor-logging-production-js
	loggingBehavior: "production",
	server: {
		androidScheme: 'https',
    }
};

const Config: CapacitorConfig = { 
	appId: 'com.foo.bar',
	appName: 'Foobar App',
    // ok: capacitor-logging-production-js
	loggingBehavior: 'none',
	server: {
		androidScheme: 'https'
    }
};

export default BadConfig;