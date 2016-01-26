Template.editPMPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singlePM', (Session.get 'currentID').toString()

Template.editPMPage.onRendered ->
  Session.set 'temp', true

Template.editPMPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editPMPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editPMPage.helpers
  customTemplate: -> Customisations.viewAsset
  pmSchema: -> Schema.pm
  viewDoc: -> PM.findOne { _id: (Session.get 'currentID').toString() }
  createdID: -> Meteor.userId()
  showIntervalUnits: -> Session.get 'temp'

Template.editPMPage.events
  'click #afIntervalType_0, click #afIntervalType_1': (e)  ->
    Session.set 'temp', true

  'click #afIntervalType_2': (e)  ->
    Session.set 'temp', false

  'click .editPM .btnAdd': (e)  ->
    MaterializeModal.display {
      bodyTemplate: 'createPMPageAddAssetGroup'
      title: 'Select Asset Group'
      callback: (error, response) ->
        if error
          console.error(error)
        else
          $( 'input[name="assetGroup_ID"]' ).val(Collections.Assetgroups.CurrentID)
    }
  'click .editPM .btnAdd2': (e) ->
    MaterializeModal.display {
      bodyTemplate: 'createPMPageAddSafetyMethod'
      title: 'Select Safety Method'
      callback: (error, response) ->
        if error
          console.error(error)
        else
          $( 'input[name="safetyPlan_ID"]' ).val(Collections.Safetyplans.CurrentID)
    }
  'click .editPM .btnAdd3': (e) ->
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

Template.editPMPageAddAssetGroup.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'assetGroups'

Template.editPMPageAddAssetGroup.helpers
  assetGrpCollection: -> Assetgroups.find {}
  agSettings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'groupText', label: ' Title' }
      { key: 'groupCreatedBy', label: ' Created By' }
      { key: '', label: 'Select', tmpl: Template.selectAssetGroupEditPM }
    ]
  }

Template.editPMPageAddAssetGroup.events
  'click .rtable .btnAdd': (e) ->
    Collections.Assetgroups.CurrentID = this._id
    MaterializeModal.close()

#---------- Safety Method Modal -------------

Template.editPMPageAddSafetyMethod.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'safetyplans'

Template.editPMPageAddSafetyMethod.helpers
  safetyMthdCollection: -> Safetyplans
  smSettings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'text', label: ' Title' }
      { key: 'createdByID', label: ' Created By' }
      { key: '', label: 'Select', tmpl: Template.selectSafetyMethodEditPM }
    ]
  }

Template.editPMPageAddSafetyMethod.events
  'click .rtable .btnAdd1': (e) ->
    Collections.Safetyplans.CurrentID = this._id
    MaterializeModal.close()

#---------- Work Plan Modal -------------

Template.editPMPageAddWorkPlan.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'workplans'

Template.editPMPageAddWorkPlan.helpers
  workPlCollection: -> Workplans
  wpSettings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'text', label: ' Title' }
      { key: 'createdByID', label: ' Created By' }
      { key: '', label: 'Select', tmpl: Template.selectWorkPlanEditPM }
    ]
  }

Template.editPMPageAddWorkPlan.events
  'click .rtable .btnAdd2': (e) ->
    Collections.Workplans.CurrentID = this._id
    MaterializeModal.close()
