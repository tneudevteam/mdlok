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
    waitOn: ->
      Meteor.subscribe 'students'

  @route '/vk', ->
    @response.writeHead 302, {
      'Location': 'http://vk.com/moduleok'
    }
    @response.end()
  , {where: 'server'}

Router.onBeforeAction ->
  if not (Meteor.user() or Meteor.loggingIn())
    Router.go '/auth'
  @next()
, except: ['auth']