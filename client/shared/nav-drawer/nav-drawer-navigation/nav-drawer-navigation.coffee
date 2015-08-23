Template.NavDrawerNavigation.events
  'click .mdl-navigation__link': ->
    # Close navigation drawer
    $('.mdl-layout__drawer.is-visible ~ .mdl-layout__obfuscator').click()