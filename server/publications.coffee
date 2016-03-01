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

ReactiveTable.publish "workorders-list", Workorders, {'status': { $in: ['5','6','7','8'] }}, {fields: {
  assetID: true
  assetText: true
  text: true
  priority: true
  }}

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

Meteor.publish 'bins-list', ->
  Bins.find {}, fields:
    text: true
    id: true

Meteor.publish 'items', ->
  Items.find {}

Meteor.publish 'equipment', ->
  Equipment.find {}

Meteor.publish 'bom', ->
  BOM.find {}

#***************************** Procurement ***********************************#
Meteor.publish 'companies', ->
  Companies.find {}

Meteor.publish 'purchases', ->
  Purchases.find {}

Meteor.publish 'singlePurchase', (purchaseId) ->
  Purchases.find {_id: purchaseId}

ReactiveTable.publish 'suppliers-list', Companies, {'type': 'supplier'}
ReactiveTable.publish 'internal-companies', Companies, {'type': 'internal'}
ReactiveTable.publish 'items-list', Items, {'status': 'active'}
ReactiveTable.publish 'purchases-list', Purchases, {'status': { $in: ['0','1','2','3','4','5','6'] }}
