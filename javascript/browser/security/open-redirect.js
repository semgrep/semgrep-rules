var hi = new URLSearchParams(window.location.search).get('gamer')

var hi1 = new URLSearchParams(window.location.search)

function test1(userInput) {
    //ruleid:js-open-redirect
    location.href = hi;
    //ruleid:js-open-redirect
    location.href = hi1.get('gamer');
}


function test4(userInput) {
    // ok:js-open-redirect
    location.href = `https://www.hardcoded.place/${userInput}`
    // ok:js-open-redirect
    location.href = "https://www.hardcoded.place/" + userInput;
}

