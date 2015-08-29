Template.Subject.onCreated ->
  @subject = new ReactiveVar false


Template.Subject.onRendered ->
  for subject in Students.findOne().semesters[0].subjects
    if subject.name is @data.name
      @subject.set subject

Template.Subject.helpers
  subject: ->
    Template.instance().subject.get()