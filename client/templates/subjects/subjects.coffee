Template.Subjects.helpers
  subjects: ->
    Students.findOne()?.semesters[0].subjects