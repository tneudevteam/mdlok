Template.Home.helpers
  'overhearedFeed': ->
    ReactiveMethod.call 'getOverhearedFeed'


Template.Home.events
  'click .overheared-post-card': (event, tmpl) ->
    postId = tmpl.$(event.currentTarget).data('post-id')
    Router.go "/pidsluhano/#{postId}"
