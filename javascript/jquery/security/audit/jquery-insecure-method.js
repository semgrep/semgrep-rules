(function ($) {

  function bad1() {
    var content = '<div>' + window.location.hash + '</div>';
    // ruleid: jquery-insecure-method
    $( "div" ).html( content );
  }

  function bad2() {
    // ruleid: jquery-insecure-method
    $( userInput ).appendTo( "#foo" );
  }

  function bad4() {
    // ruleid: jquery-insecure-method
    $('<div>' + window.location.hash + '</div>').insertBefore( ".inner" );
    // ruleid: jquery-insecure-method
    $('.inner').prepend(window.location.hash);
    function test() {
    // ruleid: jquery-insecure-method
      jQuery.globalEval('<div>' + window.location.hash + '</div>', {
        nonce: "nonce-2726c7f26c"
      } );
    }
  }

  function bad5(userInput) {
    // ruleid: jquery-insecure-method
    $( ".inner" ).wrap( "<div class='new'>" + userInput + "</div>" );
    // ruleid: jquery-insecure-method
    $( "p" ).wrapAll(userInput);
  }


  function bad6() {
    $.get(
      `/foo/${x}`,
      (response) => {
        let select = $('foo')
        for (let d of response.data) {
            let bar = $(new Data(d))
            // ruleid: jquery-insecure-method
            select.append(bar)
        }
      }
    );
  }

  function ok1() {
    const item = '<div></div>';
    // ok: jquery-insecure-method
    $( ".inner" ).wrap(item);
  }

  function ok2(userInput) {
    // ok: jquery-insecure-method
    $( "div" ).html( '<div></div>' );
  }

  function ok3(userInput) {
    jQuery(document).ready(function($){
      // ok: jquery-insecure-method
      $('<input type="checkbox"/>').prependTo('.checklist-box li');
    });
  }

  function ok4(userInput) {
      // ok: jquery-insecure-method
      var url = this.prependRestapi(userInput);
      fooBar(url);
  }

})(jQUery);
