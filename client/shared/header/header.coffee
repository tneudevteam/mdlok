Template.Header.onCreated ->
  Session.set 'appHeader', 'MODULE.OK'


Template.Header.helpers
  appHeader: ->
    Session.get 'appHeader'


Template.Header.events
  'click #refresh-data': ->
    if Meteor.user()
      Session.set 'loading', true
      Meteor.call "refresh", ->
        Session.set 'loading', false
