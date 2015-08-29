Template.Modules.helpers
  modules: ->
    modules = []
    _.each subjects, (subject, index) ->
      modules.push {name: subject.name}
      _.each subject.modules, (module, index) ->
