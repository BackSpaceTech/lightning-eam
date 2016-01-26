Template.createPMPage.onRendered ->
  Session.set 'temp', true

Template.createPMPage.onRendered ->
  Session.set 'currentDoc', Collections.Workorders.Current
  $('.tooltipped').tooltip {delay: 50}

Template.createPMPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createPMPage.helpers
  customTemplate: -> Customisations.viewAsset
  pmSchema: -> Schema.pm
  createdID: -> Meteor.userId()
  showIntervalUnits: -> Session.get 'temp'

Template.createPMPage.events
  'click #afIntervalType_0, click #afIntervalType_1': (e)  ->
    Session.set 'temp', true

  'click #afIntervalType_2': (e)  ->
    Session.set 'temp', false

  'click .createPM .btnAdd': (e)  ->
    MaterializeModal.display {
      bodyTemplate: 'createPMPageAddAssetGroup'
      title: 'Select Asset Group'
      callback: (error, response) ->
        if error
          console.error(error)
        else
          $( 'input[name="assetGroup_ID"]' ).val(Collections.Assetgroups.CurrentID)
    }
  'click .createPM .btnAdd2': (e) ->
    MaterializeModal.display {
      bodyTemplate: 'createPMPageAddSafetyMethod'
      title: 'Select Safety Method'
      callback: (error, response) ->
        if error
          console.error(error)
        else
          $( 'input[name="safetyPlan_ID"]' ).val(Collections.Safetyplans.CurrentID)
    }
  'click .createPM .btnAdd3': (e) ->
    MaterializeModal.display {
      bodyTemplate: 'createPMPageAddWorkPlan'
      title: 'Select Work Plan'
      callback: (error, response) ->
        if error
          console.error(error)
        else
          $( 'input[name="workPlan_ID"]' ).val(Collections.Workplans.CurrentID)
    }

#---------- Asset Group Modal -------------

Template.createPMPageAddAssetGroup.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'assetGroups'

Template.createPMPageAddAssetGroup.helpers
  assetGrpCollection: -> Assetgroups.find {}
  agSettings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'groupText', label: ' Title' }
      { key: 'groupCreatedBy', label: ' Created By' }
      { key: '', label: 'Select', tmpl: Template.selectAssetGroupCreatePM }
    ]
  }

Template.createPMPageAddAssetGroup.events
  'click .createPM .btnAdd4': (e) ->
    Collections.Assetgroups.CurrentID = this._id
    MaterializeModal.close()

#---------- Safety Method Modal -------------

Template.createPMPageAddSafetyMethod.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'safetyplans'

Template.createPMPageAddSafetyMethod.helpers
  safetyMthdCollection: -> Safetyplans
  smSettings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'text', label: ' Title' }
      { key: 'createdByID', label: ' Created By' }
      { key: '', label: 'Select', tmpl: Template.selectSafetyMethodCreatePM }
    ]
  }

Template.createPMPageAddSafetyMethod.events
  'click .createPM .btnAdd5': (e) ->
    Collections.Safetyplans.CurrentID = this._id
    MaterializeModal.close()

#---------- Work Plan Modal -------------

Template.createPMPageAddWorkPlan.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'workplans'

Template.createPMPageAddWorkPlan.helpers
  workPlCollection: -> Workplans
  wpSettings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'text', label: ' Title' }
      { key: 'createdByID', label: ' Created By' }
      { key: '', label: 'Select', tmpl: Template.selectWorkPlanCreatePM }
    ]
  }

Template.createPMPageAddWorkPlan.events
  'click .createPM .btnAdd6': (e) ->
    Collections.Workplans.CurrentID = this._id
    MaterializeModal.close()
