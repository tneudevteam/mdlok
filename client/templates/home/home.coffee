Template.Home.helpers
  'checkboxListItems': [
    {
      id: 'disable-auto-update'
      caption: 'Disable Autoupdate'
    }
    {
      id: 'auto-navdrawer-opened'
      caption: 'Open navigation drawer by default'
    }
  ]

Template.NavDrawerHeader.events
  'click #switch-account-button': (event, tmpl) ->
    Meteor.logout()
    Router.go '/auth'