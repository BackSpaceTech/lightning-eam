Template.viewWorkPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'quickSearch', true

Template.viewWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewWorkPage.helpers
  quickSearch: -> Session.get 'quickSearch'
  locationID: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    temp = Collections.Locations.Current
    if (temp.assetID)
      return temp.assetID + ' - ' + temp.text
    return temp.text

Template.viewWorkPage.events
  'click #swtViewWork1': -> Session.set 'quickSearch', !$('#swtViewWork1').prop('checked')
  'click .btnSearch': ->
    Collections.Workorders.workQuery = {
      asset_treePath: { $all: Collections.Locations.Current.treePath }
    }
    if (Session.get 'quickSearch')
      if ($('#radioViewWork0').prop('checked')) # My Requests
        Collections.Workorders.workQuery.reqBy_id = Meteor.userId()
      else if ($('#radioViewWork1').prop('checked')) # Open Requests
        Collections.Workorders.workQuery.status = { $in: [ '1', '2', '3' ] }
      else if ($('#radioViewWork2').prop('checked')) # Approved Work Orders
        Collections.Workorders.workQuery.status = { $in: [ '5', '6', '7', '8' ] }
    else  # Advanced Search
      tempArray =[]
      a = 0
      for a in [0...13] # Status checkboxes 0 to 12
        if $('#chkViewWork' + a).prop('checked')
          tempArray.push a.toString()
      if tempArray.length > 0
        Collections.Workorders.workQuery.status = { $in: tempArray }
      if $('#dateViewWorkFrom').val() and $('#dateViewWorkTo').val() # Get dates if not empty
        dateFrom = new Date $('#dateViewWorkFrom').val()
        dateTo =  new Date $('#dateViewWorkTo').val()
        # Add 24 hrs to end date have whole day included
        dateTo.setHours((dateTo.getHours() + 24))
        dateRange = {
          $gte: dateFrom
          $lte: dateTo
          }
        if $('#radioViewWorkDates0').prop('checked') # Requested date
          Collections.Workorders.workQuery.reqDate = dateRange
        if $('#radioViewWorkDates1').prop('checked') # WO approved date
          Collections.Workorders.workQuery.woApprovedDate = dateRange
        if $('#radioViewWorkDates2').prop('checked') # WO completed date
          Collections.Workorders.workQuery.woCompletedDate = dateRange
    console.log 'Query: '+JSON.stringify Collections.Workorders.workQuery
    FlowRouter.go '/work/query'

Template.viewWorkAdvanced.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}
  $('.datepicker').pickadate {
    selectMonths: true
    selectYears: 15
    }
