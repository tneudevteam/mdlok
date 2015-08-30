Template.Subject.onCreated ->
  @subject = new ReactiveVar false
  Session.set 'appHeader', @data.name


Template.Subject.onRendered ->
  for subject in getSubjects Students.findOne()
    if subject.name is @data.name
      for module, index in subject.modules
        module.name = "Модуль #{(index + 1)}"
      @subject.set subject

Template.Subject.helpers
  subject: ->
    Template.instance().subject.get()


Template.Subject.events
  'click .module-card': (event, tmpl) ->
    selectedModule = parseInt tmpl.$(event.currentTarget).data('name').split(' ')[1]
    Router.go "/modules##{(selectedModule - 1)}"