var hi = new URLSearchParams(window.location.search).get('gamer')

var hi1 = new URLSearchParams(window.location.search)

function test1(userInput) {
    //ruleid:js-open-redirect-from-function
    location.href = userInput;
    //ruleid:js-open-redirect-from-function
    location.href = `${userInput}/hi`
}


function test4(userInput) {
    // ok:js-open-redirect-from-function
    location.href = `https://www.hardcoded.place/${userInput}`
    // ok:js-open-redirect-from-function
    location.href = "https://www.hardcoded.place/" + userInput;
}
