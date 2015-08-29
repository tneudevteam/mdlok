Template.NavDrawerNavigation.events
  'click .mdl-navigation__link': (event, tmpl) ->
    Session.set 'appHeader', tmpl.$(event.currentTarget).find('span').text()
    # Close navigation drawer
    $('.mdl-layout__drawer.is-visible ~ .mdl-layout__obfuscator').click()