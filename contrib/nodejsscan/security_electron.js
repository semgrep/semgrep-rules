// ruleid:electron_disable_websecurity
const mainWindow = new BrowserWindow({
    webPreferences: {
        webSecurity: false
    }
})

// ruleid:electron_disable_websecurity
const config = {
    webPreferences: {
        webSecurity: false
    }
}
var newwin = new BrowserWindow(config)

// ruleid:electron_allow_http
const mainWindow = new BrowserWindow({
    webPreferences: {
        allowRunningInsecureContent: true
    }
})

// ruleid:electron_disable_websecurity
var x = new BrowserWindow({
    webPreferences: {
        webSecurity: false,
        allowRunningInsecureContent: true
    }
})

// ruleid:electron_blink_integration
const mainWindow = new BrowserWindow({
    webPreferences: {
        enableBlinkFeatures: 'ExecCommandInJavaScript'
    }
})

// ruleid:electron_allow_http
const mainWindow = new BrowserWindow({
    webPreferences: {
        allowRunningInsecureContent: true
    }
})

// ruleid:electron_nodejs_integration
const mainWindow = new BrowserWindow({
    webPreferences: {
        nodeIntegration: true,
        nodeIntegrationInWorker: true
    }
})

// ruleid:electron_context_isolation
const mainWindow = new BrowserWindow({
    webPreferences: {
        contextIsolation: false,
        preload: path.join(app.getAppPath(), 'preload.js')
    }
})
// ruleid:electron_experimental_features
const mainWindow = new BrowserWindow({
    webPreferences: {
        experimentalFeatures: true
    }
})
