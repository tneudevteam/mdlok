Template.Layout.helpers
  globalGestures: {
    'swiperight main': (event, tmpl) ->
      if tmpl.$(event.srcEvent.srcElement).closest('.subject-card').length < 1
        $('.mdl-layout__drawer-button').click()

    'swipeleft .mdl-layout__obfuscator': ->
      $('.mdl-layout__drawer-button').click()
  }

  loading: ->
    Session.get 'loading'