@getSubjects = (student) ->
  semester = student?.selectedSemester
  if semester is 2
    allYearSubjects = [].concat student.semesters[0].subjects, student.semesters[1].subjects
  else
    student?.semesters[semester].subjects

@getLastModules = (student) ->
  _.chain(getSubjects(student)
  ).map((subject) ->
     getLastModule subject
  ).filter((module) ->
    module.score > 0
  ).sortBy((module) ->
    -moment(module.date, "DD.MM.YY").unix()
  ).first(3).value()

@getLastModule = (subject) ->
  lastModuleIndex = subject.modules.length - 1
  while subject.modules[lastModuleIndex] isnt 0 and lastModuleIndex > 0
    lastModuleIndex--
  _.extend subject.modules[lastModuleIndex], {
    subjectName: subject.name
    moduleName: "Модуль #{(lastModuleIndex + 1)}"
  }

Template.registerHelper 'formatUnixTime', (date) ->
  moment.unix(date).format('DD.MM.YYYY')

Template.registerHelper 'scoreColorFor', (score) ->
  score = parseInt score
  switch
    when 90 <= score <= 100
      'mdl-color--green-600'
    when 75<= score < 90
      'mdl-color--light-green-600'
    when 60 <= score < 75
      'mdl-color--deep-orange-600'
    when 60 < score
      'mdl-color--red-600'
    else
      'mdl-color--blue-grey-600'

Template.registerHelper 'colorFor', (name) ->
  colors = [
    'mdl-color--red-700'
    'mdl-color--pink-700'
    'mdl-color--purple-700'
    'mdl-color--deep-purple-700'
    'mdl-color--indigo-700'
    'mdl-color--blue-700'
    'mdl-color--light-blue-700'
    'mdl-color--cyan-700'
    'mdl-color--teal-700'
    'mdl-color--light-green-700'
    'mdl-color--lime-700'
    'mdl-color--amber-700'
    'mdl-color--orange-700'
    'mdl-color--deep-orange-700'
    'mdl-color--brown-700'
    'mdl-color--grey-700'
    'mdl-color--blue-grey-700'
  ]

  colors[name.length % colors.length]