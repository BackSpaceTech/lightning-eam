#************************** Collections ********************************
@Locations = new Mongo.Collection 'locations'

@Workorders = new Mongo.Collection 'workorders'
if (Meteor.isServer)
  Workorders._ensureIndex {status: 1}
  Workorders._ensureIndex {asset_ID: 1}

@Workplans = new Mongo.Collection 'workplans'
@Safetyplans = new Mongo.Collection 'safetyplans'


@Assetgroups = new Mongo.Collection 'assetgroups', transform: (doc) ->
  doc.assetList = Locations.find {'_id': {'$in': doc.asset_IDs} }
  doc

@PM = new Mongo.Collection 'pm'
PM.helpers
  assetGroup: -> Assetgroups.findOne this.assetGroup_ID
  workPlan: -> Workplans.findOne this.workPlan_ID
  safetyPlan: -> Safetyplans.findOne this.safetyPlan_ID
