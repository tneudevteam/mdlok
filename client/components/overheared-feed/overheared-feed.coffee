Template.OverhearedFeed.onCreated ->
  @overhearedFeed = new ReactiveVar ({text: Array(_.random(12, 30)).join('░'), date: '1440976656'} for i in [0..4])
  Meteor.call 'getOverhearedFeed', (error, result) =>
    @overhearedFeed.set result

Template.OverhearedFeed.helpers
  overhearedFeed: ->
    Template.instance().overhearedFeed.get()
  isCordova: ->
    Meteor.isCordova