// Data accessed server side.
Meteor.publish('locationsx', function() {
  return Locations.find();
});
// Data subset subscribed to on client
Meteor.publish('locations', function(){
  return Locations.find({}, {fields: {
      text: 1,
      id: 1,
      parent:1
    }});
  });
