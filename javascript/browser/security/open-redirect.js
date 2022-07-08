var hi = new URLSearchParams(window.location.search).get('gamer')

var hi1 = new URLSearchParams(window.location.search)

var hi2 = new URL(window.location.href)

var hi3 = new URL(location.href).searchParams.get('gamer');

function test1(userInput) {
    //ruleid:js-open-redirect
    location.href = hi;
    //ruleid:js-open-redirect
    location.href = hi1.get('gamer');
    //ruleid:js-open-redirect
    location.href = hi2.searchParams.get('gamer');
    //ruleid:js-open-redirect
    location.href = hi3;
}


function test4(userInput) {
    // ok:js-open-redirect
    location.href = `https://www.hardcoded.place/${userInput}`
    // ok:js-open-redirect
    location.href = "https://www.hardcoded.place/" + userInput;
}

