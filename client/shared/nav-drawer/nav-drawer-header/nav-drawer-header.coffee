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