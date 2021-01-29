function bad1() {
    // ruleid: prohibit-jquery-html
    $( "button.continue" ).html( "Next Step..." );
}

function bad2() {
    $.ajax({
        url: "/api/getWeather",
        data: {
            zipcode: 97201
        },
        success: function( result ) {
            // ruleid: prohibit-jquery-html
            $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
        }
    });
}

function ok1() {
    // ok: prohibit-jquery-html
     $( "button.continue" ).text( "Next Step..." );
}

function bad2() {
    $.ajax({
        url: "/api/getWeather",
        data: {
            zipcode: 97201
        },
        success: function( result ) {
            // ok: prohibit-jquery-html
            HtmlUtils.setHtml( "<strong>" + result + "</strong> degrees" );
        }
    });
}
