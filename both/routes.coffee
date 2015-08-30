Router.map ->
  @configure
    layoutTemplate: 'Layout'
    loadingTemplate: 'Loading'

  @route '/',
    name: 'Home'
    waitOn: ->
      Meteor.subscribe 'students'

  @route '/auth',
    name: 'Auth'

  @route '/subjects',
    name: 'Subjects'
    waitOn: ->
      Meteor.subscribe 'students'

  @route '/subject/:name',
    name: 'Subject'
    data: ->
      name: @params.name
    waitOn: ->
      Meteor.subscribe 'students'

  @route '/modules',
    name: 'Modules'
    data: ->
      selectedModule: parseInt @params.hash
    waitOn: ->
      Meteor.subscribe 'students'

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