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
