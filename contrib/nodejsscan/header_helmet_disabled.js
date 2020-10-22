// ruleid:helmet_feature_disabled
app.use(helmet({
    frameguard: false,
}))


// ruleid:helmet_feature_disabled
app.use(helmet({
    "xssFilter": false
}))
