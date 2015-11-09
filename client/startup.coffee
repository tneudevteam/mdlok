Meteor.startup ->
  sAlert.config
    effect: ''
    position: 'top-right'
    timeout: 5000
    html: false
    onRouteClose: true
    stack: true
    offset: 50

  if Meteor.user()
    Meteor.call 'refresh', ->

  if window.loation.href.indexOf('mdlk.ml') > -1
    window.location.href  = "http://modulok.ml"