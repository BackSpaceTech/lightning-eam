Schema = {};

/************************** Assets *********************************/

Locations = new Mongo.Collection('locations');

Locations.allow({
  insert: function() {return true;},
  update: function() {return true;},
  remove: function() {return true;}
});

Schema.locations = new SimpleSchema({
  id: {type: String,label: "ID",max: 20},
  text: {type: String,label: "Title",max: 50},
  parent: {type: String,label: "Parent ID",defaultValue: "#",max: 20},
  type: {type: String,label: "Type",allowedValues: ["asset", "location"],max: 10},
  description: {type: String,label: "Description"}
});

Meteor.methods({
  createLoc: function(doc) {
    // Insert a location / asset into the collection
    Locations.insert(doc);
    this.unblock();
  },
  deleteLoc: function(doc) {
    // Delete a location / asset from the collection
    console.log("Deleting location or asset")
    Locations.remove(doc);
    this.unblock();
  }
});
