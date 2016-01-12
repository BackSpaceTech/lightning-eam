Template.editWorkorderPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Collections.Workorders.Current
  workorder: -> Collections.Workorders.Current.status > 2
  workorderFormSchema: -> Schema.workorders
  statusRequest: -> Collections.Workorders.Current.status

Template.editRequestForm.helpers
  requestOptions: ->
    return {
      0: 'Request Cancelled'
      1: 'Request Started'
      2: 'Request Returned'
      3: 'Request Accepted'
    }

Template.editWorkorderForm.helpers
  workOptions: ->
    return {
      4: 'Work Order Created'
      5: 'Work Order Approved'
      6: 'Work Order Planned'
      7: 'Work Order Scheduled'
      8: 'Work Order In Progress'
      9: 'Work Order Completed'
      10: 'Work Order Financials'
      11: 'Work Order Reviewed'
      12: 'Work Order Closed'
    }
