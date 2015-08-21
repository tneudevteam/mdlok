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

getCredentials = (tmpl) ->
  login: tmpl.$('#doAuth').val()
  password: tmpl.$('#password').val()
