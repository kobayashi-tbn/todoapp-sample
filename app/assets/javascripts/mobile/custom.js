// Custom script

$(document).ready(function(){
    // create a datepicker with default settings
    $("#scroller").scroller({ preset : 'date', dateFormat : 'yy-mm-dd',  dateOrder : 'yymmd' });
});

/*** Ajax off ***/
$(document).bind("mobileinit", function(){
//    alert('ajax disabled');
//    $.mobile.ajaxEnabled = false;
//    $.mobile.pushStateEnabled = false;
});

