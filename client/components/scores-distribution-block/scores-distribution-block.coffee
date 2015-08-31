Template.ScoresDistributionBlock.onRendered ->
  chartData = [
    {name: 'П\'ять', y: 0, color: 'rgb(67,160,71)'}
    {name: 'Чотири', y: 0, color: 'rgb(124,179,66)'}
    {name: 'Три', y: 0, color: 'rgb(244,81,30)'}
    {name: 'Два', y: 0, color: '#D32F2F'}
  ]
  subjects = getSubjects Students.findOne()
  for subject in subjects
    for module in subject.modules
      switch
        when 90 <= module.score <= 100
          chartData[0].y += 1
        when 75<= module.score < 90
          chartData[1].y += 1
        when 60 <= module.score < 75
          chartData[2].y += 1
        when 60 < module.score
          chartData[3].y += 1

  # Do not display pie section with zero scores
  for scoreData, index in chartData
    if scoreData.y is 0
      delete chartData[index]

  $('#scores-distribution-chart').highcharts
    chart:
      type: 'pie'
      backgroundColor: 'transparent'
    credits:
      enabled: false
    title:
      text: null
    legend:
      labelFormat: '{name} - {y}'
    plotOptions:
      pie:
        enableMouseTracking: false
        dataLabels:
          enabled: false
        showInLegend: true
    series: [
      {
        data: chartData
      }
    ]
