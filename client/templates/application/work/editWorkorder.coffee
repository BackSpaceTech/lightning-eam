Template.editWorkorderPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Collections.Workorders.Current
  workorderFormSchema: -> Schema.workorders
