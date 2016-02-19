Template.viewInvLocPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewInvLocPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewInvLocPage.helpers
  customTemplate: -> Customisations.viewInvLoc
  currentDoc: -> Collections.Bins.Current
  txtClassificationID: -> Classification.findOne(_id: Collections.Bins.Current.classificationID ).text

Template.viewInvLocPage.events
  'click .viewInvLoc .btnEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No item selected!'
    else
      FlowRouter.go '/inventory/locations/edit-location'
