function ok() {
    // ok:detect-no-csrf-before-method-override
    express.methodOverride()
    express.csrf()
}

function bad() {
    // ruleid:detect-no-csrf-before-method-override
    express.csrf()
    express.methodOverride()
}
