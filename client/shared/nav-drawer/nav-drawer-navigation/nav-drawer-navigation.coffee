Template.NavDrawerNavigation.onRendered ->
  studentsCount = Counts.get('studentsCount')
  @$('.students-counter .inner-text').text "Нас вже #{studentsCount}"

Template.NavDrawerNavigation.events
  'click .mdl-navigation__link': (event, tmpl) ->
    if tmpl.$(event.currentTarget).hasClass 'students-counter'
      window.open 'https://vk.com/moduleok', '_blank'
      return

    Session.set 'appHeader', tmpl.$(event.currentTarget).find('span').text()
    # Close navigation drawer
    $('.mdl-layout__drawer.is-visible ~ .mdl-layout__obfuscator').click()
