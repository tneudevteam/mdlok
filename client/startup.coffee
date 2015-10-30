Meteor.startup ->
  sAlert.config
    effect: ''
    position: 'top-right'
    timeout: 5000
    html: false
    onRouteClose: true
    stack: true
    offset: 50

  # On mdlok.ml app is embedded into iframe so scaling on mobile doesn't work
  if (document.referrer.indexOf 'mdlok.ml' or document.referrer.indexOf 'moduleok.ml') and (not Meteor.Device.isDesktop())
    window.location.href = 'http://mdlok.meteor.com'
