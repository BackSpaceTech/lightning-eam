Template.myWorkorderPage.onRendered ->
  Session.set 'currentDoc', Collections.Workorders.Current
  $('.tooltipped').tooltip {delay: 50}

Template.myWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.myWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Session.get('currentDoc')
  workorderFormSchema: -> Schema.workorders
  workorder: -> Collections.Workorders.Current.status > 2

Template.myWorkorderPage.events
  'click .btnStart': (e) ->
    Collections.Workorders.Current.startTime = new Date()
    Session.set 'currentDoc', Collections.Workorders.Current
    Collections.Workorders.Clock = $('.flipClock').FlipClock()
  'click .btnComplete': (e) ->
    for a in [0...Collections.Workorders.Current.safetyMethod.length]
      if (Collections.Workorders.Current.safetyMethod[a].id == this.id)
        temp = a
        break
    Collections.Workorders.Current.safetyMethod[temp].completed = Math.round(Collections.Workorders.Clock.getTime().time/6)/10
    Workorders.update(Collections.Workorders.Current._id, { $set: { safetyMethod: Collections.Workorders.Current.safetyMethod} })
    Session.set 'currentDoc', Collections.Workorders.Current
  'click .btnComplete2': (e) ->
    for a in [0...Collections.Workorders.Current.workPlan.length]
      if (Collections.Workorders.Current.workPlan[a].id == this.id)
        temp = a
        break
    Collections.Workorders.Current.workPlan[temp].completed = Math.round(Collections.Workorders.Clock.getTime().time/6)/10
    Workorders.update(Collections.Workorders.Current._id, { $set: { workPlan: Collections.Workorders.Current.workPlan} })
    Session.set 'currentDoc', Collections.Workorders.Current
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
        { key: '', label: 'Mark Complete', tmpl: Template.myWorkorderSafety }
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
        { key: 'estimatedHrs', label: 'Est mins' }
        { key: '', label: 'Completed', tmpl: Template.myWorkorderWorkCompleted }
        { key: '', label: 'Mark Complete', tmpl: Template.myWorkorderWork }
      ]
    }
  faultOptions: -> Lists.Workorders.Fault
  causeOptions: -> Lists.Workorders.Cause
  remedyOptions: -> Lists.Workorders.Remedy
