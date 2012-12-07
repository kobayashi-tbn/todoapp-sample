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
//= require jquery-ui
//= require ./jquery-mobile/jquery.mobile-1.2.0
//= require jquery_ujs
//= require_tree .

//$(".datepicker").datepicker();

//$(document).ready(function(){
//    $( ".datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
//});

// Swipe to Delete
$(function(){
    $('div').live('pageshow',function(event,ui){
        if ( event.target.id.indexOf('swipedelete') >= 0) {
            // remove any existing swipe areas
            $('.aDeleteBtn').remove();
            // add swipe event to the list item
            $('ul li').bind('swiperight', function(e){
                // reference the just swiped list item
                var $li = $(this);
                // remove all buttons first
                $('.aDeleteBtn').remove();
                // create buttons and div container
                var $deleteBtn = $('<a>Delete</a>').attr({
                    'class': 'aDeleteBtn ui-btn-up-r',
                    'href': '?nID=' + $li.data('nid'),
                    'method': 'delete'
                });
                // insert swipe div into list item
                $li.prepend($deleteBtn);
            });
        }
    });
});