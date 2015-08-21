Meteor.publish 'students', ->
  studentsCursor = Students.find userId: @userId
  studentGroup = studentsCursor.fetch()[0].group
  groupsCursor = Groups.find name: studentGroup

  [
    studentsCursor, groupsCursor
  ]