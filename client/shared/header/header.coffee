Template.Header.onCreated ->
  Session.set 'appHeader', 'MODULE.OK'


Template.Header.helpers
  appHeader: ->
    Session.get 'appHeader'
  displayBackButton: ->
    Session.get 'displayBackButton'


Template.Header.events
  'click #refresh-data': ->
    if Meteor.user()
      Session.set 'loading', true
      Meteor.call "refresh", ->
        Session.set 'loading', false

  'click #back-button': ->
    history.back()

  'click ul[for=options-menu] li.vk-link': ->
    window.open 'https://vk.com/moduleok', '_blank'