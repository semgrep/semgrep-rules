const shell = require('shelljs');
const express = require('express')
const router = express.Router()

router.get('/greeting', (req, res) => {
    // ruleid:shelljs_os_command_exec
    return shell.exec(req.query, { silent: true })
})

router.get('/foo', (req, res) => {
    // ruleid:shelljs_os_command_exec
    const input = `ls ${req.query}`
    return shell.exec(input, { silent: true })
})
