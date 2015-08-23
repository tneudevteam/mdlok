Template.Subjects.helpers
  subjects: ->
    Students.findOne()?.semesters[0].subjects


Template.Subjects.events
  'click .subject-card': (event, tmpl) ->
