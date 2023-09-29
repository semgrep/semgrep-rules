const corsDomains = [
  /localhost\:/,
  /(.+\.)*foo\.com$/,
  /(.+\.)*foobar\.com$/, // matches *.foobar.com,
  // ruleid: cors-regex-wildcard
  /^(http|https):\/\/(qix|qux).biz.baz.foobar.com$/,
  /^(http|https):\/\/www\.bar\.com$/,
  // ruleid: cors-regex-wildcard
  /^(http|https):\/\/www.foo.com$/,
];

const CORS = [
  /localhost\:/,
  /(.+\.)*foo\.com$/,
  /(.+\.)*foobar\.com$/, // matches *.foobar.com,
  // ruleid: cors-regex-wildcard
  /^(http|https):\/\/(qix|qux).biz.baz.foobar.com$/,
  /^(http|https):\/\/www\.bar\.com$/,
  // ruleid: cors-regex-wildcard
  /^(http|https):\/\/www.foo.com$/,
];

// ruleid: cors-regex-wildcard
const corsOrigin = /^(http|https):\/\/www.foo.com$/;

const urls = [
  /localhost\:/,
  /(.+\.)*foo\.com$/,
  /(.+\.)*foobar\.com$/, // matches *.foobar.com,
  /^(http|https):\/\/(qix|qux).biz.baz.foobar.com$/,
  /^(http|https):\/\/www\.bar\.com$/,
  /^(http|https):\/\/www.foo.com$/,
];
