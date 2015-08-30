Template.ScoresDistributionBlock.onRendered ->
  $('#scores-distribution-chart').highcharts
    chart:
      type: 'pie'
      backgroundColor: 'transparent'
    credits:
      enabled: false
    title:
      text: null
    plotOptions:
      pie:
        enableMouseTracking: false
        dataLabels:
          format: '{point.name} - {point.y}'
    series: [
      {
        data: [
          {name: 'П\'ять', y: 12, color: 'rgb(67,160,71)'}
          {name: 'Чотири', y: 21, color: 'rgb(124,179,66)'}
          {name: 'Три', y: 7, color: 'rgb(244,81,30)'}
          #          {name: 'Два', y: 1, color: '#D32F2F'}
        ]
      }
    ]