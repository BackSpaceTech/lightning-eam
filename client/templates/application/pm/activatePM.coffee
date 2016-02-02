Template.activatePMPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singlePM', Session.get('currentDoc')._id.toString()
    self.subscribe 'assetsPM', Session.get('currentDoc')._id.toString()
  this.activateAll = new ReactiveVar true
  this.setPM = new ReactiveVar {
    activate: false
  }

Template.activatePMPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
  $(".dropdown-button").dropdown()

Template.activatePMPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.activatePMPage.helpers
  customTemplate: -> Customisations.activatePM
  viewDoc: -> Collections.PM.Current
  activateAll: -> Template.instance().activateAll.get()&&(Collections.PM.Current.pmIntervalType!=1)
  timeBasedPM: -> Collections.PM.Current.pmIntervalType!=1
  setPM: -> Template.instance().setPM.get()
  workorderPMList: ->
    if !Session.get('currentDoc').workorderPM
      Session.set 'currentDoc', PM.findOne ({ _id: Session.get('currentDoc')._id.toString() })
    Session.get('currentDoc').workorderPM
  settings: ->
    temp = {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'asset_ID', label: ' Asset System ID' }
        { key: 'assetName', label: ' Asset' }
      ]
    }
    if Collections.PM.Current.pmIntervalType == 1 # Meter interval type
      temp.fields.push { key: 'meterInterval', label: ' Meter Interval' }
      temp.fields.push { key: 'meterID', label: ' Meter ID' }
    else
      temp.fields.push { key: 'cronJob', label: ' Text/Cron Expression', sortable: false } # Time interval type
      temp.fields.push { key: 'pmExpression', label: ' Scheduling Expression', sortable: false }

    temp.fields.push { label: 'Activate', tmpl: Template.rtBoolean, sortable: false }
    temp.fields.push { label: 'Change', tmpl: Template.rtEdit, sortable: false }
    temp

Template.activatePMPage.events
  'click #swtActivatePM': (event, template) ->
    template.activateAll.set(!$('#swtActivatePM').prop('checked'))
  'click .frmEdit .btnEdit': (event, template) ->
    if !Session.get('currentDoc').workorderPM
      Session.set 'currentDoc', PM.findOne ({ _id: Session.get('currentDoc')._id.toString() })
    temp = Session.get 'currentDoc'
    tempObj = {}
    MaterializeModal.form
      title: "Edit Activation Data"
      bodyTemplate: "activatePMForm"
      callback: (error, response) ->
        if response?.submit
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
          for a in [0...temp.workorderPM.length]
            temp.workorderPM[a].active = tempObj.active
            if tempObj.cronJob # Add cronJob if it exists
              temp.workorderPM[a].cronJob = tempObj.cronJob
            if tempObj.pmExpression # Add expresion if it exists
              temp.workorderPM[a].pmExpression = tempObj.pmExpression
          template.setPM.set(tempObj)
          Session.set 'currentDoc', temp
        else
          toast 'error', 'Cancelled'
  'click .rtEdit .btnEdit': (event) ->
    if !Session.get('currentDoc').workorderPM
      Session.set 'currentDoc', PM.findOne ({ _id: Session.get('currentDoc')._id.toString() })
    if (Collections.PM.Current.pmIntervalType==1) && !(Locations.findOne('_id': this.asset_ID).meters)
      toast 'error', 'Asset has no meters'
      return
    else
      Collections.Locations.CurrentID = this.asset_ID
      temp = Session.get 'currentDoc'
      for a in [0...temp.workorderPM.length]
        if temp.workorderPM[a].asset_ID == this.asset_ID
          tempIndex = a
      MaterializeModal.form
        title: "Edit Activation Data"
        bodyTemplate: "activatePMForm"
        callback: (error, response) ->
          if response?.submit
            #Iterate over form results & display.
            for key, value of response.form
              if key == 'activate-pm'
                temp.workorderPM[tempIndex].active = value
              else if key == 'cron-expression'
                if value # Add cron Job if it exists
                  temp.workorderPM[tempIndex].cronJob = value
              else if key == 'pm-expression'
                if value # Add expression if it exists
                  temp.workorderPM[tempIndex].pmExpression = value
              else if key == 'meter-interval'
                if value # Add expression if it exists
                  temp.workorderPM[tempIndex].meterInterval = value
              else if key == 'meter-id'
                if value # Add expression if it exists
                  temp.workorderPM[tempIndex].meterID = value
            Session.set 'currentDoc', temp
          else
            toast 'error', 'Cancelled'
  'submit form': (event, template) ->
    event.preventDefault()
    temp = Session.get 'currentDoc'
    tempObj = {$set: {workorderPM: temp.workorderPM}}
    timeBased = Collections.PM.Current.pmIntervalType!=1
    Meteor.call 'activatePM', tempObj, temp._id, timeBased, (error, result) ->
      if error
        toast 'error', error
      else
        toast 'success', result
      return

# ----------------------- Modal ---------------------------
Template.activatePMForm.onCreated ->
  this.rtMeterID = new ReactiveVar ''
  Collections.Locations.CurrentMeterID = ''

Template.activatePMForm.onRendered ->
  $('select').material_select()

Template.activatePMForm.helpers
  meterBasedPM: -> Collections.PM.Current.pmIntervalType==1
  timeBasedPM: -> Collections.PM.Current.pmIntervalType!=1
  meterList: -> Locations.findOne('_id': Collections.Locations.CurrentID).meters
