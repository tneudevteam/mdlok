Meteor.startup ->
  vkApiEndpoint = "https://api.vk.com/method/wall.get?owner_id=-71208622&count=7&filter=owner&v=5.37"

  Meteor.setInterval ->
    result = JSON.parse(HTTP.get(vkApiEndpoint).content).response

    last5Posts = _.chain(result.items)
    .map((post) ->
      id: post.id
      text: post.text
      date: post.date
      likes: post.likes.count or 0
      comments: post.comments.count
    ).filter((post) ->
      post.text.length > 0
    ).first(5).value()

    postsToRemove = _.pluck OverhearedFeed.find().fetch(), '_id'
    _.each last5Posts, (post) ->
      OverhearedFeed.insert post
    _.each postsToRemove, (id) ->
      OverhearedFeed.remove {_id: id}
  , 30000
