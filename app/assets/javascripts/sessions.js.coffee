Session = (->
  _post = (form) ->
    $.post('/login', form)
    .done ->
      Turbolinks.visit('/home')
    .fail ->
      Gutenberg.Alert.info '', 'Combinación de correo electrónico y contraseña incorrecta.'

  post: _post
)

Sessions = (->
  SELECTOR = "#new_user"
  JQUERY_OBJECT = $ SELECTOR

  create: ->
    JQUERY_OBJECT.on 'submit', (e) ->
      e.preventDefault()
      Session().post($(@).serializeArray())
)

SessionsRouter = ((pathname) ->
  # Actions
  postSession = Sessions().create

  # Routes
  do postSession if /^\/$/.test(pathname) or /^\/login$/.test(pathname)
)

$(document).ready -> SessionsRouter(location.pathname)
