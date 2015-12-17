Meteor.publish('locations', function() {
  return Locations.find();
});
Meteor.publish('locationsx', function() {
  return Locationsx.find();
});
