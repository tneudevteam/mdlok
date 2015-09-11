Meteor.publish 'students', ->
  Students.find {userId: @userId}, {
    fields:
      phpsessid: 0
  }