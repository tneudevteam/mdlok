Template.LastModulesBlock.onCreated ->
  Tracker.autorun =>
    student = Students.findOne()
    @lastModules = getLastModules student

Template.LastModulesBlock.helpers
  lastModules: ->
    Template.instance().lastModules
  isThereLastModules: ->
    Template.instance().lastModules.length > 0