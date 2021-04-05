const zlib = require('zlib');

const payload = Buffer.from('This is some data');

for (let i = 0; i < 30000; ++i) {
    // ruleid: zlib-async-loop
    zlib.deflate(payload, (err, buffer) => {});
}

[1,2,3].forEach((el) => {
    // ruleid: zlib-async-loop
    zlib.deflate(payload, (err, buffer) => {});
})

for (let i = 0; i < 30000; ++i) {
    // ok: zlib-async-loop
    zlib.deflateSync(payload);
}

// ok: zlib-async-loop
zlib.deflate(payload, (err, buffer) => {});
