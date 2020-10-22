if (name == 'test') {
    acces = 1;
}

// ruleid:node_timing_attack
if (password == 'mypass') {
    correct = 1;
}

// ruleid:node_timing_attack
if ('test' == password) {
    correct = 2;
}

// ruleid:node_timing_attack
if ('test' === password) {
    correct = 2;
}

// ruleid:node_timing_attack
if (password == test)
    x = 1;



// https://stackoverflow.com/a/47518578/2927282
import { pbkdf2Sync, randomBytes } from 'crypto';

export class Auth {
    iters = 1e1; // TODO: increase later
    keylen = 64;
    digest = 'sha512';

    create(password) {
        const salt = randomBytes(128).toString('base64'); // <- salt
        // salt was not base64 before being used by pbkdf2

        const hash = pbkdf2Sync(password, salt, this.iters, this.keylen, this.digest).toString('base64');

        return [salt, hash, this.iters].join('::');
    }

    verify(stored, password) {
        const [salt, hash, iters] = stored.split('::');
        const verify = pbkdf2Sync(password, salt, parseInt(iters, 10), this.keylen, this.digest);

        // ruleid:node_timing_attack
        return hash === verify.toString('base64');
    }
}

function isAuthenticated(user, token) {
    var correctToken = FetchUserTokenFromDB(user);
    // ruleid:node_timing_attack
    return token === correctToken;
}
