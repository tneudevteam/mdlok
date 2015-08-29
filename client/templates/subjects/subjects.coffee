Template.Subjects.onCreated ->
  Session.set 'appHeader', 'Предмети'


Template.Subjects.helpers
  subjects: ->
    semester = Students.findOne()?.selectedSemester
    Students.findOne()?.semesters[semester].subjects


Template.Subjects.events
  'click .subject-card': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    Session.set 'appHeader', selectedSubject
    Router.go "/subject/#{selectedSubject}"