# Data subset subscribed to on client
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

Meteor.publish 'directory', ->
  Meteor.users.find {}, fields:
    emails: true
    profile: true
    roles: true
    trades: true

Meteor.publish 'singleUser', (userId) ->
  Meteor.users.find _id: userId

Meteor.publish 'workorders', (query) ->
  Workorders.find query
