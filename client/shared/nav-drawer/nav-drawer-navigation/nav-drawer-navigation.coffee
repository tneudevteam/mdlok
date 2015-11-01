Template.NavDrawerNavigation.onRendered ->
  Meteor.call 'getStudentsCount', (err, result) ->
    studentsCount = result
    @$('.students-counter .inner-text').text "Нас вже #{studentsCount}"

Template.NavDrawerNavigation.events
  'click .mdl-navigation__link': (event, tmpl) ->
    Session.set 'appHeader', tmpl.$(event.currentTarget).find('span').text()
    # Close navigation drawer
    $('.mdl-layout__drawer.is-visible ~ .mdl-layout__obfuscator').click()

    if tmpl.$(event.target).hasClass 'students-counter'
      window.open 'https://vk.com/moduleok', '_blank'