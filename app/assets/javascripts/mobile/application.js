// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require ./custom
//= require ./jquery-mobile/jquery.mobile-1.2.0
//= require jquery_ujs
// require jq.mobi
// require jq.mobi_ujs
// require jq.ui
//= require ./mobiscroll/mobiscroll-2.2.custom.min
// require_tree .

//$(document).ready(function(){
////    $( ".datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
//
//});

//$(document).ready(function(){
$('.ui-page').live('pageinit', function(){
//    alert( 'This page was just enhanced by jQuery Mobile!' );
    var i; i = 0;
    //create a datepicker wsith default settings
    $("#scroller").scroller({ preset : 'date', dateFormat : 'yy-mm-dd',  dateOrder : 'yymmd' });
});

