import stableStringify from "json-stable-stringify";

const stringify = JSON.stringify;

// ruleid:no-stringify-keys
hashed[JSON.stringify(obj)] = obj;

// ruleid:no-stringify-keys
const result = hashed[JSON.stringify(obj)];

// ruleid:no-stringify-keys
hashed[stringify(obj)] = obj;

// ruleid:no-stringify-keys
const result = hashed[stringify(obj)];

//ok
hashed[stableStringify(obj)] = obj;

//ok
const result = hashed[stableStringify(obj)]