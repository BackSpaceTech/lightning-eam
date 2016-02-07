Template.viewInvLocClassificationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'
  Session.set 'treeviewData', 'invloc-classification'

Template.viewInvLocClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewInvLocClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewInvLocClassificationsPage.helpers
  customTemplate: -> Customisations.viewInvLocClassifications
  classificationDetails: -> Classification.findOne {_id: Session.get('currentClassID').toString() }
