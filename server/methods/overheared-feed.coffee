Meteor.methods
  'getOverhearedFeed': ->
    result = JSON.parse(HTTP.get("https://api.vk.com/method/wall.get?owner_id=-71208622&count=5&filter=owner&v=5.37").content).response
    _.map result.items, (post) ->
      id: post.id
      text: post.text
      date: post.date
      likes: post.likes.count or 0
      comments: post.comments.count