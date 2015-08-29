Template.Subjects.onCreated ->
  Session.set 'appHeader', 'Предмети'


Template.Subjects.helpers
  subjects: ->
    semester = Students.findOne()?.selectedSemester
    if semester is 2
      allYearSubjects = [].concat Students.findOne().semesters[0].subjects, Students.findOne().semesters[1].subjects
    else
      Students.findOne()?.semesters[semester].subjects


Template.Subjects.events
  'click .subject-card': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    Session.set 'appHeader', selectedSubject
    Router.go "/subject/#{selectedSubject}"