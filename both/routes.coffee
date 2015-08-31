Router.map ->
  @configure
    layoutTemplate: 'Layout'
    loadingTemplate: 'Loading'
    waitOn: ->
      [Meteor.subscribe 'students']

  @route '/',
    name: 'Home'

  @route '/auth',
    name: 'Auth'

  @route '/subjects',
    name: 'Subjects'

  @route '/subject/:name',
    name: 'Subject'
    data: ->
      name: @params.name

  @route '/modules',
    name: 'Modules'
    data: ->
      selectedModule: parseInt @params.hash

  @route '/logout',
    action: ->
      Meteor.logout()
      Router.go '/auth'

if not Meteor.isServer
  Router.onBeforeAction ->
    if not (Meteor.user() or Meteor.loggingIn())
      Router.go '/auth'
    @next()
  , except: ['auth']