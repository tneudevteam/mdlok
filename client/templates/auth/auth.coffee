Template.Auth.onCreated ->
  @loggingIn = new ReactiveVar false


Template.Auth.helpers
  'loggingIn': ->
    Template.instance().loggingIn.get()


Template.Auth.events
  'keypress #login, keypress #password': (event, tmpl) ->
    if pressedEnter = event.which is 13
      doAuth tmpl

  'click #do-auth': (event, tmpl) ->
    doAuth tmpl


doAuth = (tmpl) ->
  tmpl.loggingIn.set true

  credentials = getCredentials tmpl
  Meteor.call 'auth', credentials, (err, result) ->
    console.log err, result
    if result
      Meteor.loginWithPassword credentials.login, credentials.password

    tmpl.loggingIn.set false
    Router.go '/'

getCredentials = (tmpl) ->
  login: tmpl.$('#login').val()
  password: tmpl.$('#password').val()
