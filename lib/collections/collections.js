Locations = new Mongo.Collection('locations');

Locations.attachSchema(new SimpleSchema({
  id: {
    type: String,
    label: "Location ID",
    max: 20
  },
  locationType: {
    type: String,
    label: "Location Type",
    max: 20
  },
  text: {
    type: String,
    label: "Title",
    max: 200
  },
  description: {
    type: String,
    label: "Description"
  },
  parent: {
    type: String,
    label: "Parent Location",
    max: 200,
    optional: true
  }
}));

Locations.allow({
  insert: function() {
    return true;
  },
  update: function() {
    return true;
  },
  remove: function() {
    return true;
  }
});
