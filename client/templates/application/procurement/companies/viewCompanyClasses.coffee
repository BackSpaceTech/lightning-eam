Template.viewCompanyClassificationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'
  Session.set 'treeviewData', 'company-classification'

Template.viewCompanyClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewCompanyClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewCompanyClassificationsPage.helpers
  customTemplate: -> Customisations.viewCompanyClassifications
  classificationDetails: -> Classification.findOne {_id: Session.get('currentClassID').toString() }
