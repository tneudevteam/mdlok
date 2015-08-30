Template.Modules.onCreated ->
  Session.set 'appHeader', 'Модулі'
  @tabs = new ReactiveVar false


Template.Modules.helpers
  tabs: ->
    Template.instance().tabs.get()

  moduleGestures: {
    'swiperight .subject-card': ->
      unless isModuleOpened 'first'
        openModule 'prev'
      else
        openNavDrawer()

    'swipeleft .subject-card': ->
      unless isModuleOpened 'last'
        openModule 'next'
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

openNavDrawer = ->
  $('.mdl-layout__drawer-button').click()

isModuleOpened = (position) ->
  openedModuleId = $('.mdl-tabs__tab.is-active').attr('href')
  if position is 'first'
    openedModuleId is $('.mdl-tabs__tab').first().attr('href')
  else if position is 'last'
    openedModuleId is $('.mdl-tabs__tab').last().attr('href')

openModule = (direction) ->
  tabBar = $('.mdl-tabs__tab.is-active').removeClass('is-active')
  tabPanel = $('.module-scores-list.is-active').removeClass('is-active')

  if direction is 'next'
    tabBar = tabBar.next()
    tabPanel = tabPanel.next()
  else if direction is 'prev'
    tabBar = tabBar.prev()
    tabPanel = tabPanel.prev()

  tabBar.addClass('is-active')
  tabPanel.addClass('is-active')

Template.Modules.events
  'click .subject-card': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    Router.go "/subject/#{selectedSubject}"
