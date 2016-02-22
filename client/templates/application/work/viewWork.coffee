Template.viewWorkPage.onCreated ->
  this.quickSearch = new ReactiveVar true

Template.viewWorkPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  temp = Locations.find().fetch()
  dataTree(temp , 'general')

Template.viewWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewWorkPage.helpers
  quickSearch: -> Template.instance().quickSearch.get()
  assetDetails: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    Collections.Locations.Current

Template.viewWorkPage.events
  'click #swtViewWork1': (event, template) ->
    template.quickSearch.set(!$('#swtViewWork1').prop('checked'))
  'click .btnSearch': (event, template) ->
    Collections.Workorders.workQuery = {
      asset_treePath: { $all: Collections.Locations.Current.treePath }
    }
    if (template.quickSearch.get())
      if ($('#radioViewWork0').prop('checked')) # My Requests
        Collections.Workorders.workQuery.reqBy_id = Meteor.userId()
      else if ($('#radioViewWork1').prop('checked')) # Open Requests
        Collections.Workorders.workQuery.status = { $in: [ '1', '2' ] }
      else if ($('#radioViewWork2').prop('checked')) # Approved Work Orders
        Collections.Workorders.workQuery.status = { $in: [ '3', '4' ] }
      else if ($('#radioViewWork3').prop('checked')) # Approved Work Orders
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
    Meteor.call 'setWorkQuery', Collections.Workorders.workQuery, (error, result) ->
      if error
        Materialize.toast("Error", 3000, "red")
      else
        Materialize.toast("Querying server...", 3000, "teal")
      return
    FlowRouter.go '/work/query'

Template.viewWorkAdvanced.onRendered ->
  dataTree()
  $('.tooltipped').tooltip {delay: 50}
  $('.datepicker').pickadate {
    selectMonths: true
    selectYears: 15
    }
