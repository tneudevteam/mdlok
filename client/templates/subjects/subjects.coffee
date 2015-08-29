Template.Subjects.onCreated ->
  Session.set 'appHeader', 'Предмети'


Template.Subjects.helpers
  subjects: ->
    getSubjects Students.findOne()


Template.Subjects.events
  'click .subject-card': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    Session.set 'appHeader', selectedSubject
    Router.go "/subject/#{selectedSubject}"