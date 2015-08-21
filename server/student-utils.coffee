@StudentUtils = (student) ->
  getOverAllAverageScore: ->
    scoresCount = 0
    scoresSum = 0
    sumScores = (subject) ->
      _.map subject.modules, (module) ->
        score = parseInt(module.score)
        if score > 0
          scoresCount++
          scoresSum += score

    _.map student.firstSemester.subjects, sumScores
    _.map student.secondSemester.subjects, sumScores

    scoresSum / scoresCount