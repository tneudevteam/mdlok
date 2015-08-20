Router.configure
  layoutTemplate: 'layout'

Router.route '/',
  name: 'Home'

Router.route '/go', ->
  @response.writeHead 302, {
    'Location': @params.query.to
  }
  @response.end()
, {where: 'server'}