Schema = {};
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

Schema.locations = new SimpleSchema({
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
    label: "Parent ID",
    max: 20,
    optional: true
  },
  type: {
    type: String,
    label: "Type",
    max: 10
  },
  description: {
    type: String,
    label: "Description"
  }
});

Meteor.methods({
  createLoc: function(doc) {
    console.log("doc: "+JSON.stringify(doc))
    // Insert a locataion / asset into the collection
    Locations.insert(doc);
    this.unblock();
  }
});
