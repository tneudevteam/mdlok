Meteor.methods
  getStudentsCount: ->
    Students.find().count()