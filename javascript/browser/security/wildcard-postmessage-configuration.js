let data={pName : "Bob", pAge: "35"};
var popup = window.open(/* popup details */);

//ruleid:wildcard-postmessage-configuration
popup.postMessage(data, '*');
//ruleid:wildcard-postmessage-configuration
popup.postMessage( JSON.stringify( data ), '*' );

//postMessage Safe Usage
popup.postMessage("hello there!", "http://domain.tld");
popup.postMessage( JSON.stringify( data ), 'semgrep.dev/editor');
