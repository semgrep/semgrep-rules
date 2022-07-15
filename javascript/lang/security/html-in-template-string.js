
// ok: html-in-template-string
const planet = `world`;
const greeting = "hello";

// ok: html-in-template-string
let a = `hello ${planet}`;

// ruleid: html-in-template-string
let b = `<h1>hello ${planet}</h1>`;

// ruleid: html-in-template-string
let start = `<h1>hello ${planet}`;

// ruleid: html-in-template-string
let end = `${planet}</h1><b>foo</b>`;

// ruleid: html-in-template-string
let two = `<h1>${greeting} beautiful ${planet}</h1>`;

function createHtml() {
    // from issue #1385
    // ruleid: html-in-template-string
    return `<div style=${style.color}>${content}</div>`
}
