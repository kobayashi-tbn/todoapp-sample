/**
 * Created with JetBrains RubyMine.
 * User: toshinobu
 * Date: 2012/12/09
 * Time: 0:00
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(function(){
    // create a datepicker with default settings
    $(".scroller2").scroller({ 'present': 'date', 'dateFormat': 'yy-mm-dd', 'dateOrder': 'ymd' });
});

/*** Ajax off ***/
$(document).bind("mobileinit", function(){
//    alert('ajax disabled');
//    $.mobile.ajaxEnabled = false;
//    $.mobile.pushStateEnabled = false;
});

