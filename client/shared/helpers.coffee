Template.registerHelper 'colorFor', (name) ->
  colors = [
    'mdl-color--red-700'
    'mdl-color--pink-700'
    'mdl-color--purple-700'
    'mdl-color--deep-purple-700'
    'mdl-color--indigo-700'
    'mdl-color--blue-700'
    'mdl-color--light-blue-700'
    'mdl-color--cyan-700'
    'mdl-color--teal-700'
    'mdl-color--light-green-700'
    'mdl-color--lime-700'
    'mdl-color--amber-700'
    'mdl-color--orange-700'
    'mdl-color--deep-orange-700'
    'mdl-color--brown-700'
    'mdl-color--grey-700'
    'mdl-color--blue-grey-700'
  ]

  colors[name.length % colors.length]