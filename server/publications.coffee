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

#********************** Work Orders *****************************#
Meteor.publish 'workorders', ->
  Workorders.find {}

ReactiveTable.publish 'workorder-data', Workorders, ->
  Collections.Workorders.workQuery

Meteor.publish 'my-work', (userId) ->
  Workorders.find {'workTeam.userID': userId}, {limit: 100, sort: {priority: 1}}

Meteor.publish 'workplans', ->
  Workplans.find {}, fields:
    text: true
    createdByID: true

Meteor.publish 'singleWorkplan', (workplanId) ->
  Workplans.find {_id: workplanId}

Meteor.publish 'safetyplans', ->
  Safetyplans.find {}, fields:
    text: true
    createdByID: true

Meteor.publish 'singleSafetymethod', (safetymethodId) ->
  Safetyplans.find {_id: safetymethodId}

#********************** Work Orders *****************************#
Meteor.publish 'pm', ->
  PM.find {}, fields:
    active: true
    pmDescription: true
    assetGroup: true

Meteor.publish 'singlePM', (pmId) ->
  PM.find {_id: pmId}
