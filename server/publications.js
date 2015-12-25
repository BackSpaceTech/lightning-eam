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

Meteor.publish("directory", function () {
  return Meteor.users.find({}, {fields: {
    emails: 1,
    profile: 1
  }});
});
