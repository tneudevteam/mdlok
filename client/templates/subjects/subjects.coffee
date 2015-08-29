Template.Subjects.onCreated ->
  Session.set 'appHeader', 'Предмети'


Template.Subjects.helpers
  subjects: ->
    Students.findOne()?.semesters[0].subjects


Template.Subjects.events
  'click .subject-card': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    Session.set 'appHeader', selectedSubject
    Router.go "/subject/#{selectedSubject}"