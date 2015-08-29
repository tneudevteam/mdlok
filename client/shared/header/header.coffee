Template.Header.onCreated ->
  Session.set 'appHeader', 'MODULE.OK'


Template.Header.helpers
  appHeader: ->
    Session.get 'appHeader'