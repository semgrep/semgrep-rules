function test1(userInput) {
    //ruleid:js-open-redirect
    location.replace(userInput);
}

function test2(userInput) {
    //ruleid:js-open-redirect
    location.href = "https://www.hardcoded.place" + userInput;
}

function testOk() {
    //ok:js-open-redirect
    window.location.href = "/hardcoded-place";
}
