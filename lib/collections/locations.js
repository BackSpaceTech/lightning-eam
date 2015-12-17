Locations = new Mongo.Collection('locations');
Locationsx = new Mongo.Collection('locationsx');

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

Locations.attachSchema(new SimpleSchema({
  id: {
    type: String,
    label: "ID",
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
  parent: {
    type: String,
    label: "Parent Location",
    max: 200,
    optional: true
  }
}));

Locationsx.attachSchema(new SimpleSchema({
  id: {
    type: String,
    label: "ID",
    max: 20
  },
  Type: {
    type: String,
    label: "Type",
    max: 20
  },
  description: {
    type: String,
    label: "Description"
  }
}));
