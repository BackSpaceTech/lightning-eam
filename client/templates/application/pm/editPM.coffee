Template.editPMPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singlePM', (Session.get 'currentID').toString()

Template.editPMPage.onRendered ->
  $(".dropdown-button").dropdown()  

Template.editPMPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editPMPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editPMPage.helpers
  customTemplate: -> Customisations.viewAsset
  pmSchema: -> Schema.pm
  viewDoc: -> PM.findOne { _id: (Session.get 'currentID').toString() }
  createdID: -> Meteor.userId()

Template.editPMPage.events
  'click .editPM .btnAdd': (event)  ->
    MaterializeModal.display {
      bodyTemplate: 'createPMPageAddAssetGroup'
      title: 'Select Asset Group'
      callback: (error, response) ->
        if error
          console.error(error)
        else
          $( 'input[name="assetGroup_ID"]' ).val(Collections.Assetgroups.CurrentID)
    }
  'click .editPM .btnAdd2': (event) ->
    MaterializeModal.display {
      bodyTemplate: 'createPMPageAddSafetyMethod'
      title: 'Select Safety Method'
      callback: (error, response) ->
        if error
          console.error(error)
        else
          $( 'input[name="safetyPlan_ID"]' ).val(Collections.Safetyplans.CurrentID)
    }
  'click .editPM .btnAdd3': (event) ->
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
  'click .rtable .btnAdd': (event) ->
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
  'click .rtable .btnAdd1': (event) ->
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
  'click .rtable .btnAdd2': (event) ->
    Collections.Workplans.CurrentID = this._id
    MaterializeModal.close()
