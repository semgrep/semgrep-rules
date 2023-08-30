// ruleid: detect-insecure-websocket
var scheme   = "ws://";
var uri      = scheme + window.document.location.host + "/";
var ws       = new WebSocket(uri);
ws.onmessage = function(message) {}


// at start of the line
// ruleid: detect-insecure-websocket
ws://foo/bar

// ok: detect-insecure-websocket
var secure_url = "wss://my/url";

// ok: detect-insecure-websocket
var amazon_url = "aws://my/url";

// from https://github.com/ytdl-org/youtube-dl/blob/master/youtube_dl/extractor/yahoo.py#L124
// ok: detect-insecure-websocket
// # ytwnews://cavideo/

// ok: detect-insecure-websocket
var localhost = "ws://localhost:27017/freecodecamp?directConnection=true";

// ok: detect-insecure-websocket
var local = "ws://127.0.0.1:3000"
