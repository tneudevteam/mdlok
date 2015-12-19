Template.Subjects.onCreated ->
  Session.set 'appHeader', 'Предмети'
  @modulesNumber = new ReactiveVar [1..4]


Template.Subjects.helpers
  subjects: ->
    getSubjects Students.findOne()

  modulesNumber: ->
    Template.instance().modulesNumber.get()

  summarySubjects: ->
    subjects = getSubjects Students.findOne()
    maxModulesNumber = 0

    for subject in subjects
      if subject.modules.length > maxModulesNumber
        maxModulesNumber = subject.modules.length

    Template.instance().modulesNumber.set [1..maxModulesNumber]

    for subject in subjects
      if subject.modules.length isnt maxModulesNumber
        _.times maxModulesNumber - subject.modules.length, ->
          subject.modules.push {
            date: ''
            score: ''
            weight: ''
          }

    subjects


Template.Subjects.events
  'click .subject-card, click .subject-row': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    selectedSubjectType = tmpl.$(event.currentTarget).data('type')
    Router.go "/subject/#{selectedSubject}@#{selectedSubjectType}"