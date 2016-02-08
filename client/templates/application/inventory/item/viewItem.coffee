Template.viewItemPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewItemPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewItemPage.helpers
  customTemplate: -> Customisations.viewItem
  currentDoc: -> Items.findOne(Session.get('currentID').toString())
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.viewItemPage.events
  'click .viewItem .btnEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No item selected!'
    else
      FlowRouter.go '/items/edit-item'
