Template.OverhearedFeed.helpers
  overhearedFeed: ->
    OverhearedFeed.find({}, {limit: 5})
