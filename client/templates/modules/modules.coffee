Template.Modules.onCreated ->
  Session.set 'appHeader', 'Модулі'
  @tabs = new ReactiveVar false


Template.Modules.helpers
  tabs: ->
    Template.instance().tabs.get()

  modules: ->
    subjects = getSubjects Students.findOne()
    modules = []
    _.each subjects, (subject, index) ->
      _.each subject.modules, (module, index) ->
        if not modules[index]
          modules[index] =
            subjects: []
        modules[index].subjects.push _.extend subject.modules[index], {name: subject.name}

    Template.instance().tabs.set _.map modules, (module, index) ->
      name: "#{(index + 1)}"
      id: "module#{index}"

    _.map modules, (module, index) ->
      module.id = "module#{index}"
      module


Template.Modules.events
  'click .subject-card': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    Router.go "/subject/#{selectedSubject}"
