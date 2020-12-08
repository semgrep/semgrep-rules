//ruleid:insufficient-postmessage-origin-validation
window.addEventListener("message", receiveMessage, false);


//addEventListener Safe Usage (Origin Checked)
const globalRegex = RegExp('/^http://www.examplesender.com$/', 'g');
window.addEventListener("message", function(message){
    if(globalRegex.test(message.origin)){
         console.log(message.data);
   }
});

//addEventListener Safe Usage (Origin Checked)
window.addEventListener("message", function(message){
if (event.origin !== "http://example.com") {
    return;
}
});

//addEventListener Safe Usage (Origin Checked)
window.addEventListener("message", function(message){
if (event.origin == "http://example.com") {
    alert("Works");
}
});
