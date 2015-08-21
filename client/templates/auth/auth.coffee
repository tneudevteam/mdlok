Template.Auth.events
  'keypress #login, keypress #password': (event, tmpl) ->
    if pressedEnter = event.which is 13
      login getCredentials tmpl

  'click #do-auth': (event, tmpl) ->
    login getCredentials tmpl


getCredentials = (tmpl) ->
  login: tmpl.$('#login').val()
  password: tmpl.$('#password').val()

login = (credentials) ->
  console.log credentials