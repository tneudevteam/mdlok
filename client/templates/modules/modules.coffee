Template.Modules.onCreated ->
  Session.set 'appHeader', 'Модулі'
  @tabs = new ReactiveVar false


Template.Modules.helpers
  tabs: ->
    Template.instance().tabs.get()

  moduleGestures: {
    'swiperight .subject-card': ->
      if notFirstTab = $('.mdl-tabs__tab').first().attr('href') isnt $('.mdl-tabs__tab.is-active').attr('href')
        $('.mdl-tabs__tab.is-active').removeClass('is-active').prev().addClass('is-active')
        $('.module-scores-list.is-active').removeClass('is-active').prev().addClass('is-active')

    'swipeleft .subject-card': ->
      if notLastTab = $('.mdl-tabs__tab').last().attr('href') isnt $('.mdl-tabs__tab.is-active').attr('href')
        $('.mdl-tabs__tab.is-active').removeClass('is-active').next().addClass('is-active')
        $('.module-scores-list.is-active').removeClass('is-active').next().addClass('is-active')
  }

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
