Meteor.publish 'students', ->
  studentsCursor = Students.find userId: @userId
  studentGroup = Students.findOne(userId: @userId)?.group
  groupsCursor = Groups.find name: studentGroup

  [
    studentsCursor, groupsCursor
  ]