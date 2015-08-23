Meteor.publish 'students', ->
  Students.find userId: @userId