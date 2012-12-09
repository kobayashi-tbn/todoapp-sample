# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
  html = """
           <div id="dialog-confirm" title="Confirm...">
             <p>""" + link.attr('message')+ """</p>
           </div>
           """
  $(html).dialog
    head: false
    resizable: false
    modal: true
    buttons:
      Cancel: ->
        $(this).dialog "close"
      OK: ->
        $.rails.confirmed link
        $(this).dialog "close"


