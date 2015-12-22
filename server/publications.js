// Data subset subscribed to on client
Meteor.publish('locations', function() {
  return Locations.find({}, {fields: {
    text: true,
    id: true,
    type:true,
    meters:true,
    parent:true
  }});
});

Meteor.publish('singleLocation', function(locationId) {
  return Locations.find({id:locationId});
});
