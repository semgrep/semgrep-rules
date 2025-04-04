let data={pName : "Bob", pAge: "35"};
var popup = window.open(/* popup details */);
const transfer = new Uint8Array(1024 * 1024 * 8).map((v, i) => i);
const targetOrigin = "https://example.com"

//ruleid:wildcard-postmessage-configuration
popup.postMessage(data, '*');
//ruleid:wildcard-postmessage-configuration
popup.postMessage( JSON.stringify( data ), '*' );
//ruleid:wildcard-postmessage-configuration
window.top?.postMessage("data", "*", [
    transfer,
]);

//postMessage Safe Usage
//ok:wildcard-postmessage-configuration
popup.postMessage("hello there!", "http://domain.tld");
//ok:wildcard-postmessage-configuration
popup.postMessage( JSON.stringify( data ), 'semgrep.dev/editor');
//ok:wildcard-postmessage-configuration
popup.postMessage( data, targetOrigin, transfer);
