Template.NavDrawer.helpers
  'navigationLinks': [
    {
      caption: 'Головна'
      route: '/'
      icon: 'home'
    }
    {
      caption: 'Предмети'
      route: '/subjects'
      icon: 'view_column'
    }
    {
      caption: 'Модулі'
      route: '/modules'
      icon: 'subject'
    }
    {
      caption: 'Нас вже ░'
      route: ''
      class: 'students-counter'
      icon: 'supervisor_account'
    }
    {
      caption: 'Вийти'
      route: '/logout'
      icon: 'swap_horiz'
      spaceBefore: true
    }
  ]