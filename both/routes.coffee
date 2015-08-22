Router.configure
  layoutTemplate: 'Layout'
  loadingTemplate: 'Loading'

Router.route '/',
  name: 'Home'
  waitOn: ->
    Meteor.subscribe 'students'

Router.route '/auth',
  name: 'Auth'

Router.route '/subjects',
  name: 'Subjects'

Router.route '/modules',
  name: 'Modules'

Router.route '/vk', ->
  @response.writeHead 302, {
    'Location': 'http://vk.com/moduleok'
  }
  @response.end()
, {where: 'server'}