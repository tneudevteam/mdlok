Template.Modules.onCreated ->
  Session.set 'appHeader', 'Модулі'
  Session.set 'displayBackButton', yes
  @tabs = new ReactiveVar false

Template.Modules.onDestroyed ->
  Session.set 'displayBackButton', no


Template.Modules.onRendered ->
  if @data.selectedModule
    openModule @data.selectedModule - 1

Template.Modules.helpers
  tabs: ->
    Template.instance().tabs.get()

  moduleGestures: {
    'swiperight .module-card': ->
      unless isModuleOpened 'first'
        openModule 'prev'
      else
        openNavDrawer()

    'swipeleft .module-card': ->
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
        subjectElement = _.extend subject.modules[index], {
          name: subject.name
          type: subject.controlType
        }
        modules[index].subjects.push subjectElement

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

openModule = (index) ->
  tabBar = $('.mdl-tabs__tab.is-active').removeClass('is-active')
  tabPanel = $('.module-scores-list.is-active').removeClass('is-active')

  switch
    when index is 'next'
      tabBar = tabBar.next()
      tabPanel = tabPanel.next()
    when index is 'prev'
      tabBar = tabBar.prev()
      tabPanel = tabPanel.prev()
    when _.isNumber index
      tabBar = $(".mdl-tabs__tab[href=#module#{index}]")
      tabPanel = $(".module-scores-list[id=module#{index}]")

  tabBar.addClass('is-active')
  tabPanel.addClass('is-active')

Template.Modules.events
  'click .module-card ': (event, tmpl) ->
    selectedSubject = tmpl.$(event.currentTarget).data('name')
    selectedSubjectType = tmpl.$(event.currentTarget).data('type')
    Router.go "/subject/#{selectedSubject}@#{selectedSubjectType}"
