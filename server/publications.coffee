#**************** Assets / Locations ***********#
Meteor.publish 'locations', ->
  Locations.find {}, fields:
    text: true
    id: true
    type: true
    meters: true
    parent: true
    treePath:true
    assetID:true

Meteor.publish 'singleLocation', (locationId) ->
  Locations.find _id: locationId

Meteor.publish 'classification', ->
  Classification.find {}

#************************ Resources *****************************#
Meteor.publish 'directory', ->
  Meteor.users.find {}, fields:
    emails: true
    profile: true
    roles: true
    trades: true
    certifications: true

Meteor.publish 'singleUser', (userId) ->
  Meteor.users.find {_id: userId}

ReactiveTable.publish "resources-data", Meteor.users, {}, {fields: {password: 0}}

#***************************** Work Orders ***********************************#
Meteor.publish 'workorders', ->
  Workorders.find {}

ReactiveTable.publish 'workorder-data', Workorders, ->
  Collections.Workorders.workQuery

Meteor.publish 'my-work', (userId) ->
  Workorders.find {'workTeam.userID': userId}, {limit: 100, sort: {priority: 1}}

Meteor.publish 'workplans', ->
  Workplans.find {}

Meteor.publish 'singleWorkplan', (workplanId) ->
  Workplans.find {_id: workplanId}

Meteor.publish 'safetyplans', ->
  Safetyplans.find {}

Meteor.publish 'singleSafetymethod', (safetymethodId) ->
  Safetyplans.find {_id: safetymethodId}

#***************************** PM ********************************************#
Meteor.publish 'pm', ->
  PM.find {}, fields:
    active: true
    pmDescription: true
    pmIntervalType: true
    createdBy_id: true
    assetGroup_ID: true

Meteor.publish 'singlePM', (pmId) ->
  PM.find {_id: pmId}

Meteor.publish 'assetGroups', ->
  Assetgroups.find {}

Meteor.publish 'singleAssetGroup', (groupId) ->
  Assetgroups.find {_id: groupId}

#***************************** Inventory *************************************#
Meteor.publish 'bins', ->
  Bins.find {}

Meteor.publish 'items', ->
  Items.find {}

Meteor.publish 'equipment', ->
  Equipment.find {}
