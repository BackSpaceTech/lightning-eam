Template.myWorkorderPage.onRendered ->
  Session.set 'currentDoc', Collections.Workorders.Current
  $('.tooltipped').tooltip {delay: 50}

Template.myWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.myWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Session.get('currentDoc')
  workorder: -> Collections.Workorders.Current.status > 2
  myWorkorderSchema: -> Schema.workorders

Template.myWorkorderPage.events
  'click .myWorkorder .btnStart': (e) ->
    if Collections.Workorders.Current.startTime
      MaterializeModal.confirm
        title: 'Reset work Order?',
        label: 'You have already started this work Order. Do You want to delete the start time?',
        message: 'Yes, or no?',
        callback: (error, response) ->
          if response.submit
            # Reset start time
            Collections.Workorders.Current.startTime = ''
            Workorders.update(Collections.Workorders.Current._id, { $unset: { startTime: ''} })
            # Reset safety method start times
            for a in [0...Collections.Workorders.Current.safetyMethod.length]
              Collections.Workorders.Current.safetyMethod[a].completed =''
            Workorders.update(Collections.Workorders.Current._id, { $set: { safetyMethod: Collections.Workorders.Current.safetyMethod} })
            # Reset work plan start times
            for a in [0...Collections.Workorders.Current.workPlan.length]
              Collections.Workorders.Current.workPlan[a].completed =''
            Workorders.update(Collections.Workorders.Current._id, { $set: { workPlan: Collections.Workorders.Current.workPlan} })
            # Update UI
            Session.set 'currentDoc', Collections.Workorders.Current
            if (!jQuery.isEmptyObject Collections.Workorders.Clock) && (Collections.Workorders.Clock.getTime().time>0)
              Collections.Workorders.Clock.reset()
              $('.flipClock').hide()
              toastr.success 'Reset Work Order'
          else
            return
    else
      # Record wo start time and start timer
      Collections.Workorders.Current.startTime = new Date()
      Workorders.update(Collections.Workorders.Current._id, { $set: { startTime: Collections.Workorders.Current.startTime} })
      Session.set 'currentDoc', Collections.Workorders.Current
      Collections.Workorders.Clock = $('.flipClock').FlipClock()
      $('.flipClock').show()
  'click .myWorkorder .btnComplete': (e) ->
    if (!jQuery.isEmptyObject Collections.Workorders.Clock) && (Collections.Workorders.Clock.getTime().time>0)
      # Get the array index of the task
      for a in [0...Collections.Workorders.Current.safetyMethod.length]
        if Collections.Workorders.Current.safetyMethod[a].id == this.id
          temp = a
          break
      # Record start time in mins from wo start
      Collections.Workorders.Current.safetyMethod[temp].completed = Math.round(Collections.Workorders.Clock.getTime().time/6)/10
      Workorders.update(Collections.Workorders.Current._id, { $set: { safetyMethod: Collections.Workorders.Current.safetyMethod} })
      Session.set 'currentDoc', Collections.Workorders.Current
    else
      MaterializeModal.message
        title: 'Start Work Order',
        message: 'Please click on start work order at top of page.'
  'click .myWorkorder .btnComplete2': (e) ->
    if (!jQuery.isEmptyObject Collections.Workorders.Clock) && (Collections.Workorders.Clock.getTime().time>0)
      # Get the array index of the task
      for a in [0...Collections.Workorders.Current.workPlan.length]
        if (Collections.Workorders.Current.workPlan[a].id == this.id)
          temp = a
          break
      # Record start time in mins from wo start
      Collections.Workorders.Current.workPlan[temp].completed = Math.round(Collections.Workorders.Clock.getTime().time/6)/10
      Workorders.update(Collections.Workorders.Current._id, { $set: { workPlan: Collections.Workorders.Current.workPlan} })
      Session.set 'currentDoc', Collections.Workorders.Current
    else
      MaterializeModal.message
        title: 'Start Work Order',
        message: 'Please click on start work order at top of page.'
  'click .myWorkorder .btnView': (e) ->
    modalBody = Spacebars.SafeString('Hazards: '+this.hazards+'<br>Controls: '+this.controls+'<br>Responsible: '+this.responsible)
    MaterializeModal.message
      title: this.activity
      message: modalBody

  'click .myWorkorder .btnView2': (e) ->
    modalBody = Spacebars.SafeString('Instructions: '+this.text+'<br>Est mins: '+this.estimatedTime)
    MaterializeModal.message
      title: this.activity
      message: modalBody

Template.myWoForm.helpers
  viewDoc: -> Collections.Workorders.Current
  safetyDoc: -> Session.get('currentDoc').safetyMethod
  settingsSafety: ->
    return {
      rowsPerPage: 10
      showFilter: false
      fields:  [
        { key: 'id', label: 'Sequence ID'}
        { key: 'activity', label: ' Activity' }
        { key: 'hazards', label: ' Hazards' }
        { key: 'controls', label: ' Risk control measures' }
        { key: 'responsible', label: 'Responsible' }
        { key: '', label: 'Completed', tmpl: Template.myWorkorderSafetyCompleted }
        { key: '', label: 'View/Complete', tmpl: Template.myWorkorderSafety }
      ]
    }
  workDoc: -> Session.get('currentDoc').workPlan
  settingsWork: ->
    return {
      rowsPerPage: 10
      showFilter: false
      fields:  [
        { key: 'id', label: 'Sequence ID'}
        { key: 'text', label: 'Instructions' }
        { key: 'estimatedTime', label: 'Est mins' }
        { key: '', label: 'Completed', tmpl: Template.myWorkorderWorkCompleted }
        { key: '', label: 'View/Complete', tmpl: Template.myWorkorderWork }
      ]
    }
  faultOptions: -> Lists.Workorders.Fault
  causeOptions: -> Lists.Workorders.Cause
  remedyOptions: -> Lists.Workorders.Remedy
