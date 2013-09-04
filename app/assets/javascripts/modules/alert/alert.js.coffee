Alert = (->
  SELECTOR = '.not-signed-alert'
  JQUERY_OBJECT = $ SELECTOR

  _format_info = (title, message) ->
    "<div class='alert fade in alert-info'>
      <button class='close' data-dismiss='alert' type='button'>&#x2716;</button>
      <strong>#{title}</strong>
      #{message}
    </div>"

  info: (title, message) ->
    JQUERY_OBJECT.html _format_info(title, message)
    @

  close: ->
    window.setTimeout ->
      JQUERY_OBJECT.html ''
    , 4000
    @
)

$(document).ready -> window.Gutenberg.Alert = Alert()
