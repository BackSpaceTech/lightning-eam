#************************** Collections ********************************
@Locations = new Mongo.Collection('locations')

@Workorders = new Mongo.Collection('workorders')
if (Meteor.isServer)
  Workorders._ensureIndex({status: 1})
  Workorders._ensureIndex({asset_ID: 1})
