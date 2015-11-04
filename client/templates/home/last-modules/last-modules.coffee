Template.LastModulesBlock.onCreated ->
  @lastModules = getLastModules Students.findOne()

Template.LastModulesBlock.helpers
  lastModules: ->
    Template.instance().lastModules
  isThereLastModules: ->
    Template.instance().lastModules.length > 0