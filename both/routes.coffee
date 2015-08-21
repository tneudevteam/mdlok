Router.configure
  layoutTemplate: 'Layout'
  loadingTemplate: 'Loading'

Router.route '/',
  name: 'Home'

Router.route '/auth',
  name: 'Auth'

Router.route '/vk', ->
  @response.writeHead 302, {
    'Location': 'http://vk.com/moduleok'
  }
  @response.end()
, {where: 'server'}