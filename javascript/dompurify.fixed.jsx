/*
 * Control permitted attribute values
 */

/**
 * Influence the return-type
 */

// return a DOM HTMLBodyElement instead of an HTML string (default is false)
// ok
var clean = DOMPurify.sanitize(dirty, {RETURN_DOM: true});

// return a DOM DocumentFragment instead of an HTML string (default is false)
// ok
var clean = DOMPurify.sanitize(dirty, {RETURN_DOM_FRAGMENT: true});

// return a DOM DocumentFragment instead of an HTML string (default is false)
// also import it into the current document (default is false).
// RETURN_DOM_IMPORT must be set if you would like to append
// the returned node to the current document
// ok
var clean = DOMPurify.sanitize(dirty, {RETURN_DOM_FRAGMENT: true, RETURN_DOM_IMPORT: true});
document.body.appendChild(clean);

// ruleid: harden-dompurify-usage
var yikes = DOMPurify.sanitize(dirty, {RETURN_DOM: true})
document.body.innerHTML = yikes;


// ruleid: harden-dompurify-usage
dosomethingsketchy(DOMPurify.sanitize(dirty, {RETURN_DOM: true}));
