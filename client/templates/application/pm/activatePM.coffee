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
              if value
                tempObj.active = value
              else
                tempObj.active = false
            else if key == 'cron-expression'
              if value # Add cron Job if it exists
                tempObj.cronJob = value
            else if key == 'pm-expression'
              if value # Add expression if it exists
                tempObj.pmExpression = value
            else if key == 'recur-every'
              if value # Add expression if it exists
                tempObj.recurPeriod = value
            else if key == 'recur-starting'
              if value # Add expression if it exists
                tempObj.recurStart = value
          if tempObj.cronJob == '0' # Convert recur to text expression
            tempObj = convertGUItoCron tempObj
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
                if value
                  temp.workorderPM[tempIndex].active = value
                else
                  temp.workorderPM[tempIndex].active = false
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
              else if key == 'recur-every'
                if value # Add expression if it exists
                  temp.workorderPM[tempIndex].recurPeriod = value
              else if key == 'recur-starting'
                if value # Add expression if it exists
                  temp.workorderPM[tempIndex].recurStart = value
            if temp.workorderPM[tempIndex].tempObj.cronJob ==0 # Convert recur to text expression
              temp.workorderPM[tempIndex] = convertGUItoCron temp.workorderPM[tempIndex]
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
        FlowRouter.go history.back()
      else
        toast 'success', result
        FlowRouter.go history.back()
      return

@convertGUItoCron = (tempObj) ->
  tempObj.cronJob = '1' # change to text expression type
  if !tempObj.recurStart
    tempObj.recurStart = ''
  switch tempObj.recurPeriod
    when '0' then tempObj.pmExpression = 'every '+Lists.PM.Recur[0].period # Daily
    when '1' then tempObj.pmExpression = 'every '+Lists.PM.Recur[1].period+' starting on the '+tempObj.recurStart # Weekly
    when '2' then tempObj.pmExpression = 'every '+Lists.PM.Recur[2].period+' starting on the '+tempObj.recurStart # Monthly
    when '3' then tempObj.pmExpression = 'every '+Lists.PM.Recur[3].period+' starting on the '+tempObj.recurStart # Yearly
    when '4' then tempObj.pmExpression = 'every '+Lists.PM.Recur[4].period # Weekdays
    when '5' then tempObj.pmExpression = 'every '+Lists.PM.Recur[5].period # Weekends
  console.log 'tempObj: '+JSON.stringify tempObj
  return tempObj

# ----------------------- Modal ---------------------------
Template.activatePMForm.onCreated ->
  Collections.Locations.CurrentMeterID = ''

Template.activatePMForm.onRendered ->
  $('select').material_select()
  $(".cronExpression").hide()
  $(".gui-start-day").hide()
  $(".gui-num-days").hide()
  $(".gui-start-month").hide()
  $(".gui-num-months").hide()
  $(".gui-weekdays").hide()
  $(".gui-start-year").hide()
  $(".gui-num-years").hide()

Template.activatePMForm.helpers
  meterBasedPM: -> Collections.PM.Current.pmIntervalType==1
  timeBasedPM: -> Collections.PM.Current.pmIntervalType!=1
  cronList: ->
    tempArray = []
    for prop of Lists.PM.CronType
      tempArray.push {
        id: prop
        text: Lists.PM.CronType[prop]
      }
    tempArray
  guiList: ->
    if !Collections.Crontasks.guiList
      Collections.Crontasks.guiList = []
      for prop of Lists.PM.CronGUI
        Collections.Crontasks.guiList.push {
          id: prop
          text: Lists.PM.CronGUI[prop].text
        }
    Collections.Crontasks.guiList
  guiStartTime: ->
    if !Collections.Crontasks.guiStartTime
      Collections.Crontasks.guiStartTime = []
      for a in [0...24]
        Collections.Crontasks.guiStartTime[a] ={
          id: a
          text: a+':00'
        }
        if a < 10
          Collections.Crontasks.guiStartTime[a].text = '0'+a+':00'
    Collections.Crontasks.guiStartTime
  guiStartDay: ->
    if !Collections.Crontasks.guistartDay
      Collections.Crontasks.guistartDay = []
      for a in [1...32]
        Collections.Crontasks.guistartDay[a] = a
    Collections.Crontasks.guistartDay
  guiNumDays: ->
    if !Collections.Crontasks.guiNumDays
      Collections.Crontasks.guiNumDays = []
      for a in [1...32]
        Collections.Crontasks.guiNumDays[a] = a
    Collections.Crontasks.guiNumDays
  guiStartMonth: ->
    if !Collections.Crontasks.guistartMonth
      Collections.Crontasks.guistartMonth = []
      for a in [1...13]
        Collections.Crontasks.guistartMonth[a] = a
    Collections.Crontasks.guistartMonth
  guiNumMonths: ->
    if !Collections.Crontasks.guiNumMonths
      Collections.Crontasks.guiNumMonths = []
      for a in [1...13]
        Collections.Crontasks.guiNumMonths[a] = a
    Collections.Crontasks.guiNumMonths
  guiWeekdays: -> [
      {
        id: 'MON-FRI'
        text: 'Weekdays'
      }
      {
        id: 'SAT,SUN'
        text: 'Weekend Days'
      }
    ]

  meterList: -> Locations.findOne('_id': Collections.Locations.CurrentID).meters

Template.activatePMForm.events
  'click .pmExpression a': (event) ->
    temp = $("input[name='pm-expression']").val()
    s = later.parse.cron temp
    occurrences = later.schedule(s).next(10)
    msg = 'Next ten occurrences for: '+temp+'\n'
    if occurrences
      for a in [0...occurrences.length]
        msg += occurrences[a] + '\n'
    else
      msg = 'Invalid Cron Expression!'
    alert msg

  'change .timeBased select[name="cron-expression"]': (event) ->
    temp = $( "select[name='cron-expression']" ).val()
    if temp=='0' # Show GUI
      $(".cronGUI").show()
      $(".cronExpression").hide()
    else # Show expression box
      $(".cronExpression").show()
      $(".cronGUI").hide()
  'change .timeBased select[name="gui-type"]': (event) ->
    temp = $( "select[name='gui-type']" ).val()
    tempList = Lists.PM.CronGUI
    if tempList[temp].startTime
      $(".gui-start-time").show()
    else
      $(".gui-start-time").hide()
    if tempList[temp].startDay
      $(".gui-start-day").show()
    else
      $(".gui-start-day").hide()
    if tempList[temp].periodDay
      $(".gui-num-days").show()
    else
      $(".gui-num-days").hide()
    if tempList[temp].startMonth
      $(".gui-start-month").show()
    else
      $(".gui-start-month").hide()
    if tempList[temp].periodMonth
      $(".gui-num-months").show()
    else
      $(".gui-num-months").hide()
    if tempList[temp].weekday
      $(".gui-weekdays").show()
    else
      $(".gui-weekdays").hide()
    if tempList[temp].startYear
      $(".gui-start-year").show()
    else
      $(".gui-start-year").hide()

    if tempList[temp].periodYear
      $(".gui-num-years").show()
    else
      $(".gui-num-years").hide()
