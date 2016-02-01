#************************** Collections ********************************
@Locations = new Mongo.Collection 'locations'

@Workorders = new Mongo.Collection 'workorders'
if Meteor.isServer
  Workorders._ensureIndex {status: 1}
  Workorders._ensureIndex {asset_ID: 1}

@Workplans = new Mongo.Collection 'workplans'
@Safetyplans = new Mongo.Collection 'safetyplans'

@Assetgroups = new Mongo.Collection 'assetgroups', transform: (doc) ->
  doc.assetList = Locations.find( {'_id': {'$in': doc.asset_IDs} }, { fields:
    text: true
    assetID: true
    parent: true
    treePath: true
    meters: true} ).fetch()
  doc

@PM = new Mongo.Collection 'pm', transform: (doc) ->
  doc.assetGroupDetails = Assetgroups.findOne {'_id': doc.assetGroup_ID }
  doc.workPlanDetails = Workplans.findOne {'_id': doc.workPlan_ID }
  doc.safetyPlanDetails = Safetyplans.findOne {'_id': doc.safetyPlan_ID }
  doc.userDetails = Meteor.users.findOne {'_id': doc.createdBy_id }, fields:
    profile: true
  doc

if Meteor.isServer
  @Crontasks = new Mongo.Collection 'crontasks'
