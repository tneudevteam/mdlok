Meteor.methods
  'getOverhearedFeed': ->
    result = JSON.parse(HTTP.get("https://api.vk.com/method/wall.get?owner_id=-71208622&count=7&filter=owner&v=5.37").content).response
    _.chain(result.items)
    .map((post) ->
      id: post.id
      text: post.text
      date: post.date
      likes: post.likes.count or 0
      comments: post.comments.count
    ).filter((post) ->
      post.text.length > 0).first(5).value()