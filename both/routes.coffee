Router.configure
  layoutTemplate: 'Layout'
  loadingTemplate: 'Loading'

Router.route '/',
  name: 'Home'

Router.route '/auth',
  name: 'Auth'

Router.route '/go', ->
  @response.writeHead 302, {
    'Location': @params.query.to
  }
  @response.end()
, {where: 'server'}