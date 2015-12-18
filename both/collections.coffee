@Students = new Mongo.Collection 'students'
@OverhearedFeed = new Mongo.Collection 'overhearedFeed'

@Students.allow
  update: -> yes