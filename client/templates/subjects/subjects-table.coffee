Template.SubjectsTable.onCreated ->
  @modulesNumber = new ReactiveVar [1..4]


Template.SubjectsTable.helpers
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
      subject.controlTypeShort = subject.controlType[0]
      if subject.modules.length isnt maxModulesNumber
        _.times maxModulesNumber - subject.modules.length, ->
          subject.modules.push {
            date: ''
            score: '–'
            weight: ''
          }

    for subject in subjects
      realModulesCount = _.filter(subject.modules, (module) ->
        module.score isnt 0 and module.score isnt '' and module.score isnt '–'
      ).length
      allScoresSum = _.chain(subject.modules).filter((module) ->
        module.score isnt 0 and module.score isnt '–' and module.score isnt ''
      ).reduce(((memo, num) ->
        memo + num.score
      ), 0).value()
      subject.averageScore = Math.round(allScoresSum / realModulesCount)

    subjects


Template.SubjectsTable.events
  'click .subject-row': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    selectedSubjectType = tmpl.$(event.currentTarget).data('type')
    Router.go "/subject/#{selectedSubject}@#{selectedSubjectType}"
  'click .module-link': (event, tmpl) ->
    selectedModule = tmpl.$(event.currentTarget).data('module')
    Router.go "/modules##{selectedModule}"