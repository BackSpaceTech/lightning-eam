Template.editWorkorderPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Collections.Workorders.Current
  workorder: -> Collections.Workorders.Current.status > 3
  workorderFormSchema: -> Schema.workorders
  statusRequest: -> Collections.Workorders.Current.status

Template.editRequestForm.helpers
  requestOptions: ->
    return {
      '0': 'Request Cancelled'
      '1': 'Request Started'
      '2': 'Request Accepted'
      '3': 'Request Returned'
    }
