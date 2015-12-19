Locations = new Mongo.Collection('locations');

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
  text: {
    type: String,
    label: "Title",
    max: 50
  },
  parent: {
    type: String,
    label: "Parent Location",
    max: 20,
    optional: true
  },
  type: {
    type: String,
    label: "Type",
    max: 10
  }
}));
