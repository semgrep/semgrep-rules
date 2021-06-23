// ruleid: cors_regex_wildcard
const corsDomains = [
    /localhost\:/,
    /(.+\.)*foo\.com$/,
    /(.+\.)*foobar\.com$/, // matches *.foobar.com,
    /^(http|https):\/\/(qix|qux).biz.baz.foobar.com$/,
    /^(http|https):\/\/www\.bar\.com$/,
    /^(http|https):\/\/www.foo.com$/,
];

// ruleid: cors_regex_wildcard
const CORS = [
    /localhost\:/,
    /(.+\.)*foo\.com$/,
    /(.+\.)*foobar\.com$/, // matches *.foobar.com,
    /^(http|https):\/\/(qix|qux).biz.baz.foobar.com$/,
    /^(http|https):\/\/www\.bar\.com$/,
    /^(http|https):\/\/www.foo.com$/,
];

// ruleid: cors_regex_wildcard
const corsOrigin = /^(http|https):\/\/www.foo.com$/;

const urls = [
    /localhost\:/,
    /(.+\.)*foo\.com$/,
    /(.+\.)*foobar\.com$/, // matches *.foobar.com,
    /^(http|https):\/\/(qix|qux).biz.baz.foobar.com$/,
    /^(http|https):\/\/www\.bar\.com$/,
    /^(http|https):\/\/www.foo.com$/,
];
