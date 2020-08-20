const element = document.getElementById('#element');

// ok
element.innerHTML = '<span>This is a static string<span>';

// ok
const innerHtml = "<span>This is a static string<span>";
element.innerHTML = innerHtml;

const d = '';

// ruleid:innerHTML
element.innerHTML = innerHtml + ' ' + d;

// ruleid:innerHTML
element.innerHTML = `${innerHtml} `;

// ruleid:innerHTML
element.innerHTML = innerHtml.concat('');

function evalSomething(something) {
    // ruleid:innerHTML
    element.innerHTML = something;
}
