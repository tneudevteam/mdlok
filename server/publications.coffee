Meteor.publish 'students', ->
  Students.find {userId: @userId}, {credentials: 0}