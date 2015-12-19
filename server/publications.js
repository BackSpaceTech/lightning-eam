// Data subset subscribed to on client
Meteor.publish('locations', function(){
  return Locations.find({}, {fields: {
    text: 1,
    id: 1,
    type:1,
    parent:1
  }});
});
