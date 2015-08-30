Meteor.publish 'students', ->
  Students.find {userId: @userId}, {
    fields:
      credentials: 0
  }