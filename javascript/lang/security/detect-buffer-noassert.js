// ok:detect-buffer-noassert
a.readUInt8(0)

// ok:detect-buffer-noassert
a.readUInt8(0, false)

// ruleid:detect-buffer-noassert
a.readUInt8(0, true)
