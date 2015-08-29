Template.NavDrawerHeader.helpers
  name: ->
    student = Students.findOne()
    if student
      student.name.split(' ')[0..1].join(' ')
    else 'Прізвище Ім\'я'

  group: ->
    student = Students.findOne()
    if student
      student.group
    else 'ГРУПА-23'

Template.NavDrawerHeader.events
  'click ul[for="semester-dropdown-button"] li': (event, tmpl) ->
    selectedSemester = tmpl.$(event.currentTarget).data('semester')
    if Meteor.userId()
      Students.update {userId: Meteor.userId()}, {
        selectedSemester: selectedSemester
      }