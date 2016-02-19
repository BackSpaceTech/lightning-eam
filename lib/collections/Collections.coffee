#************************** Collections ********************************
@Locations = new Mongo.Collection 'locations', transform: (doc) ->
  if doc.assetClassificationID
    doc.assetClassification = Classification.findOne {'_id': doc.assetClassificationID }, { fields:
      text: true}
  doc

@Classification = new Mongo.Collection 'classification'

@Workorders = new Mongo.Collection 'workorders'
if Meteor.isServer
  Workorders._ensureIndex {status: 1}
  Workorders._ensureIndex {asset_ID: 1}

@Workplans = new Mongo.Collection 'workplans'
@Safetyplans = new Mongo.Collection 'safetyplans'

@Assetgroups = new Mongo.Collection 'assetgroups', transform: (doc) ->
  if doc.asset_IDs
    doc.assetList = Locations.find( {'_id': {'$in': doc.asset_IDs} }, { fields:
      text: true
      assetID: true
      parent: true
      treePath: true
      meters: true} ).fetch()
  doc

@PM = new Mongo.Collection 'pm', transform: (doc) ->
  if doc.assetGroup_ID
    doc.assetGroupDetails = Assetgroups.findOne {'_id': doc.assetGroup_ID }
  if doc.workPlan_ID
    doc.workPlanDetails = Workplans.findOne {'_id': doc.workPlan_ID }
  if doc.safetyPlan_ID
    doc.safetyPlanDetails = Safetyplans.findOne {'_id': doc.safetyPlan_ID }
  if doc.createdBy_id
    doc.userDetails = Meteor.users.findOne {'_id': doc.createdBy_id }, fields:
      profile: true
  doc
if Meteor.isServer
  PM._ensureIndex {workorderPM: 1}

if Meteor.isServer
  @Crontasks = new Mongo.Collection 'crontasks'

@Bins = new Mongo.Collection 'bins'
@Items = new Mongo.Collection 'items'
@Equipment = new Mongo.Collection 'equipment'
@BOM = new Mongo.Collection 'bom'

@Companies = new Mongo.Collection 'companies'
@Purchases = new Mongo.Collection 'purchases'
