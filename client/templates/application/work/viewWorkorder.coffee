Template.viewWorkorderPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Collections.Workorders.Current
  workorderFormSchema: -> Schema.workorders

Template.viewWorkorderPage.events
  'click .btnEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'
  'click .btnCopy': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'
