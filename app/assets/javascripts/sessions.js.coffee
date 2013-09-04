Session = (->
  _post = (form) ->
    $.post('/users/sign_in', form)
    .done -> 
    	Turbolinks.visit('/home')
    .fail ->
      Gutenberg.Alert.info '', 'Combinación de correo electrónico y contraseña incorrecta.'

  post: _post
)

Sessions = (->
	SELECTOR = "form[action='/users/sign_in']"
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
  do postSession if /^\/$/.test(pathname) or /^\/users\/sign_in$/.test(pathname)
)

$(document).ready -> SessionsRouter(location.pathname)
