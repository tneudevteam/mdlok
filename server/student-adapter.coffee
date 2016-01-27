@StudentAdapter = (student) ->
  withUserId: (userId) ->
    student.userId = userId
    @

  withSessionId: (phpsessid) ->
    student.phpsessid = phpsessid
    @

  withWeirdCookie: (weirdCookie) ->
    student.weirdCookie = weirdCookie
    @

  get: ->
    student.semesters = []
    student.semesters.push student.firstSemester
    student.semesters.push student.secondSemester
    delete student.firstSemester
    delete student.secondSemester
    student.averageScore = getOverAllAverageScore student
    student.selectedSemester = 0
    student

getOverAllAverageScore = (student) ->
  scoresCount = 0
  scoresSum = 0
  sumScores = (semester) ->
    _.map semester.subjects, (subject) ->
      _.map subject.modules, (module) ->
        score = parseInt(module.score)
        if score > 0
          scoresCount++
          scoresSum += score

  _.map student.semesters, sumScores

  scoresSum / scoresCount