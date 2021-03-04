function bad1(input) {
    // ruleid:prohibit-jquery-html
    $( "button.continue" ).html( input );
}

function bad2() {
    $.ajax({
        url: "/api/getWeather",
        data: {
            zipcode: 97201
        },
        success: function( result ) {
            // ruleid:prohibit-jquery-html
            $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
        }
    });
}

function ok1() {
    // ok: prohibit-jquery-html
     $( "button.continue" ).text( "Next Step..." );
}

function ok2() {
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

function ok3() {
    // ok: prohibit-jquery-html
    $('.js-piechart-container').html('<canvas class="js-pie-chart" style="width:100%;height:300px;"></canvas>')
}
