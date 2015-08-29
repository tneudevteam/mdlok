Template.Subject.onCreated ->
  @subject = new ReactiveVar false


Template.Subject.onRendered ->
  for subject in getSubjects Students.findOne()
    if subject.name is @data.name
      @subject.set subject

Template.Subject.helpers
  subject: ->
    Template.instance().subject.get()