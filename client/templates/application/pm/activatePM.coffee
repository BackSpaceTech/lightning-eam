startActivatePM = true

Template.activatePMPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singlePM', Session.get('currentDoc')._id.toString()
  this.activateAll = new ReactiveVar true
  this.setPM = new ReactiveVar {
    activate: false
  }

Template.activatePMPage.onRendered ->
  $(".dropdown-button").dropdown()
  Session.set 'temp', true

Template.activatePMPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.activatePMPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.activatePMPage.helpers
  customTemplate: -> Customisations.activatePM
  activateAll: -> Template.instance().activateAll.get()
  pmSchema: -> Schema.pm
  viewDoc: ->
    if startActivatePM
      Collections.PM.Current = PM.findOne ({ _id: Session.get('currentDoc')._id.toString() })
      startActivatePM = false
      Session.set 'currentDoc', Collections.PM.Current
    Collections.PM.Current
  setPM: -> Template.instance().setPM.get()
  workorderPMList: -> Session.get('currentDoc').workorderPM
  settings: ->
    temp = {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'asset_ID', label: ' Asset System ID' }
        { key: 'assetName', label: ' Asset' }
      ]
    }
    if Collections.PM.Current.pmIntervalType == 2 # Meter interval type
      temp.fields.push { key: 'meterInterval', label: ' Meter Interval' }
    else
      temp.fields.push { key: 'cronJob', label: ' Text/Cron Expression', sortable: false } # Time interval type
      temp.fields.push { key: 'pmExpression', label: ' Scheduling Expression', sortable: false }

    temp.fields.push { label: 'Activate', tmpl: Template.rtBoolean, sortable: false }
    temp.fields.push { label: 'Change', tmpl: Template.rtEdit, sortable: false }
    temp

Template.activatePMPage.events
  'click #swtActivatePM': (event, template) ->
    template.activateAll.set(!$('#swtActivatePM').prop('checked'))
  'click .rtBoolean': (event) ->
    temp = Collections.PM.Current.workorderPM
    for a in [0...temp.length]
      if temp[a].asset_ID == this.asset_ID
        temp[a].active = !temp[a].active
    Collections.PM.Current.workorderPM = temp
    Session.set 'currentDoc', Collections.PM.Current
  'click .frmEdit .btnEdit': (event, template) ->
    temp = Collections.PM.Current.workorderPM
    tempObj = {}
    MaterializeModal.form
      title: "Edit Activation Data"
      bodyTemplate: "activatePMForm"
      callback: (error, response) ->
        if response?.submit
          console.log 'Reading form..'
          #Iterate over form results & display.
          for key, value of response.form
            if key == 'activate-pm'
              tempObj.active = value
            else if key == 'cron-expression'
              if value # Add cron Job if it exists
                tempObj.cronJob = value
            else if key == 'pm-expression'
              if value # Add expression if it exists
                tempObj.pmExpression = value
          # Update workorderPM
          for a in [0...temp.length]
            temp[a].active = tempObj.active
            if tempObj.cronJob # Add cronJob if it exists
              temp[a].cronJob = tempObj.cronJob
          template.setPM.set(tempObj)
          Collections.PM.Current.workorderPM = temp
          Session.set 'currentDoc', Collections.PM.Current
        else
          toast 'error', 'Cancelled'
  'click .rtEdit .btnEdit': (event) ->
    temp = Collections.PM.Current.workorderPM
    for a in [0...temp.length]
      if temp[a].asset_ID == this.asset_ID
        tempIndex = a
    MaterializeModal.form
      title: "Edit Activation Data"
      bodyTemplate: "activatePMForm"
      callback: (error, response) ->
        if response?.submit
          #Iterate over form results & display.
          for key, value of response.form
            if key == 'activate-pm'
              temp[tempIndex].active = value
            else if key == 'cron-expression'
              if value # Add cron Job if it exists
                temp[tempIndex].cronJob = value
            else if key == 'pm-expression'
              if value # Add expression if it exists
                temp[tempIndex].pmExpression = value
          Collections.PM.Current.workorderPM = temp
          Session.set 'currentDoc', Collections.PM.Current
        else
          toast 'error', 'Cancelled'
  'submit form': (event, template) ->
    event.preventDefault()
    temp = {$set: {workorderPM: Collections.PM.Current.workorderPM}}
    Meteor.call 'updatePM', temp, Collections.PM.Current._id, (error, result) ->
      if error
        toast 'error', error
      else
        toast 'success', result
      return
