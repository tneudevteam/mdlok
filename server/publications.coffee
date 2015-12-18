Meteor.publish 'students', ->
  Counts.publish @, 'studentsCount', Students.find(), {noReady: true, nonReactive: true}
  Students.find {userId: @userId}, {
    fields:
      phpsessid: 0
      weirdCookie: 0
  }

Meteor.publish 'overhearedFeed', ->
  OverhearedFeed.find()