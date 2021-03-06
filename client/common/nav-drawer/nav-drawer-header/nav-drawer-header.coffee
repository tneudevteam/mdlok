Template.NavDrawerHeader.helpers
  name: ->
    student = Students.findOne()
    if student
      student.name.split(' ')[0..1].join(' ')
    else '░░░░░░░░░ ░░░░░░'

  group: ->
    student = Students.findOne()
    if student
      student.group
    else '░░░░-░░'

  semester: ->
    student = Students.findOne()
    switch parseInt student?.selectedSemester
      when 0 then 'Перший семестр'
      when 1 then 'Другий семестр'
      when 2 then 'Увесь рік'

Template.NavDrawerHeader.events
  'click ul[for="semester-dropdown-button"] li': (event, tmpl) ->
    selectedSemester = tmpl.$(event.currentTarget).data('semester')
    if Meteor.userId()
      studentsId = Students.findOne()._id
      Students.update {_id: studentsId}, {
        $set:
          selectedSemester: selectedSemester
      }
    # Close navigation drawer
    $('.mdl-layout__drawer.is-visible ~ .mdl-layout__obfuscator').click()