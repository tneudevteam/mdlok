@StudentUtils = (student) ->
  mergeSemesters: ->
    student.semesters = []
    student.semesters.push student.firstSemester
    student.semesters.push student.secondSemester
    delete student.firstSemester
    delete student.secondSemester
    student

  getOverAllAverageScore: ->
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