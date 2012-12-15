# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# ref http://www.jqmobi.com/documentation.php#tips/tips_customclick
# but... not unnecessary?
#$.ui.customClickHandler = $.rails.showConfirmDialog

$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  link.attr('message', link.attr('data-confirm')) # message copy
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.attr('method', link.attr('data-method'))
  link.removeAttr('data-confirm')
  link.trigger('click') # ...link.trigger('click.rails') is original

$.rails.showConfirmDialog = (link) ->
  $("#jQUi").popup
    head: false
    resizable: false
    message: link.attr("message")
    modal: true
    cancelText: "Cancel"
    #cancelCallback: ->
    doneText: "OK"
    doneCallback: ->
        $.rails.confirmed link

#  html = """
#           <div id="dialog-confirm" title="Confirm...">
#             <p>""" + link.attr('message')+ """</p>
#           </div>
#           """
#  $(html).dialog
#    head: false
#    resizable: false
#    modal: true
#    buttons:
#      Cancel: ->
#        $(this).dialog "close"
#      OK: ->
#        $.rails.confirmed link
#        $(this).dialog "close"


