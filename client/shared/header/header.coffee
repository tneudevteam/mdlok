Template.Header.onCreated ->
  Session.set 'appHeader', 'MODULE.OK'


Template.Header.helpers
  tabs: ->
    Session.get 'tabs'
  appHeader: ->
    Session.get 'appHeader'