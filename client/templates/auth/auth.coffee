Template.Auth.onCreated ->
  @loggingIn = new ReactiveVar false
  @doAuth = =>
    credentials = {
      login: @$('#login').val()
      password: @$('#password').val()
    }

    @loggingIn.set true
    Meteor.promise('auth', credentials)
    .then(=>
      Meteor.loginWithPassword credentials.login, credentials.password, ->
        Router.go '/'
    ).catch(=>
      sAlert.error 'Неправильний логін або пароль'
      @loggingIn.set false
    )


Template.Auth.helpers
  loggingIn: ->
    Template.instance().loggingIn.get()


Template.Auth.events
  'keypress #login, keypress #password': (event, tmpl) ->
    if pressedEnter = event.which is 13
      tmpl.doAuth()

  'click #do-auth': (event, tmpl) ->
    tmpl.doAuth()
