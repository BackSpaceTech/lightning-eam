Template.viewWorkorderPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: ->
    console.log "Collections.Workorders.Current: "+JSON.stringify(Collections.Workorders.Current)
    return Collections.Workorders.Current
  workorderFormSchema: -> Schema.workorders
  workorder: -> Collections.Workorders.Current.status > 2
  settingsSafety: ->
    return {
      rowsPerPage: 10
      showFilter: false
      fields:  [
        { key: 'createdBy', label: 'Created by' }
        { key: 'activity', label: ' Activity' }
        { key: 'hazards', label: ' Hazards' }
        { key: 'controls', label: ' Risk control measures' }
        { key: 'responsible', label: 'Responsible' }
        { key: 'completedTime', label: 'Completed Time' }
        { key: '', label: 'Start/Complete', tmpl: Template.viewWorkorderSafety }
      ]
    }

  settingsWork: ->
    return {
      rowsPerPage: 10
      showFilter: false
      fields:  [
        { key: 'id', label: 'Sequence ID' }
        { key: 'text', label: 'Instructions' }
        { key: 'estimatedHrs', label: 'Est hrs' }
        { key: 'finishTime', label: 'Finish Time' }
        { key: 'completedTime', label: 'Completed Time' }
        { key: '', label: 'Start/Complete', tmpl: Template.viewWorkorderWork }
      ]
    }
