// ok:detect-buffer-noassert
a.readUInt8(0)

// ok:detect-buffer-noassert
a.readUInt8(0, false)

// ruleid:detect-buffer-noassert
a.readUInt8(0, true)

// ruleid:detect-buffer-noassert
a.writeFloat16LE(0, true)