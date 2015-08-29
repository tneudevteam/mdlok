Template.OverhearedFeed.helpers
  'overhearedFeed': ->
    ReactiveMethod.call 'getOverhearedFeed'

Template.Home.events
  'click .overheared-post-card': (event, tmpl) ->
    postId = tmpl.$(event.currentTarget).data('post-id')
    window.open "https://vk.com/public71208622?w=wall-71208622_#{postId}", '_blank'
