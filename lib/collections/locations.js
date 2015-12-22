/************************** Locations & Assets ********************************/

Locations = new Mongo.Collection('locations');

Locations.allow({
  insert: function() {return true;},
  update: function() {return true;},
  remove: function() {return true;}
});

Schema.locations = new SimpleSchema({
    id: {type: String,label: "ID"},
    text: {type: String,label: "Title"},
    parent: {type: String,label: "Parent ID", defaultValue: "#"},
    type: {type: String,label: "Type",
      autoform: {type: "select",options: function () {
          return [
            {label: "Location", value: "location"},
            {label: "Asset", value: "asset"}
          ]}}},
    description: {type: String,label: "Description", optional: true},
    lat1: {type: Number, optional: true},
    long1:{type: Number, optional: true},
    lat2:{type: Number, optional: true},
    long2:{type: Number, optional: true},
    linear: {type: Boolean,label: "Linear Asset", defaultValue: false},
    safety: {type: String,label: "Safety Instructions", optional: true},
    criticality: {type: Number,label: "Criticality",
      autoform: {type: "select",options: function () {
        return GlobalData.Collections.Locations.Criticality}}},
    classification: {type: String,label: "Classification", optional: true,
      autoform: {type: "select",options: function () {
        return GlobalData.Collections.Locations.Classification}}},
    status: {type: String,label: "Status",defaultValue: "inservice",
      autoform: {type: "select",options: function () {
        return GlobalData.Collections.Locations.Status}}},
    rotable: {type: Boolean,label: "Rotable Asset", defaultValue: false},
    rotableID: {type: Boolean,label: "Rotable ID", optional: true},
    referenceID: {type: String,label: "Reference ID", optional: true},
    address: {type: String,label: "Address", optional: true},
    state: {type: String,label: "State", optional: true},
    zip: {type: String,label: "Zip Code", optional: true},
    country: {type: String,label: "Country", optional: true},
    urlTechData: {type: String,label: "Tech Data URL", optional: true},
    urlOpData: {type: String,label: "Ops Data URL", optional: true},
    urlPhoto: {type: String,label: "Photo URL", optional: true},
    serialNumber: {type: String,label: "Serial Number", optional: true},
    modelNumber: {type: String,label: "Model Number", optional: true},
    manufacturer: {type: String,label: "Manufacturer", optional: true},
    manufPhone: {type: String,label: "Manuf. Phone", optional: true},
    manufAddress: {type: String,label: "Manuf. Address", optional: true},
    manufState: {type: String,label: "Manuf. State", optional: true},
    manufZip: {type: String,label: "Manuf. Zip", optional: true},
    manufDate: {type: Date,label: " ", optional: true},
    installDate: {type: Date,label: " ", optional: true}
});

Meteor.methods({
  createLoc: function(doc) {
    // Check if id already exists
    var exists = Locations.findOne({"id": doc.id});
    if(exists)
     {
       throw new Meteor.Error("id-already-used", "The ID is already used, please select a new ID.");
       console.log ("ID already exists, please provide a unique ID.");
     }
     else{
       // Insert a location / asset into the collection
       Locations.insert(doc);
       this.unblock();
     }
  },
  deleteLoc: function(doc) {
    // Delete a location / asset from the collection
    Locations.remove(doc);
    this.unblock();
  },
  createMeter: function(doc, meter) {
    // Check if meter array already exists
    if (doc.meters)
     {
       Locations.update(doc, { $push: { meters: meter} });
     }
     Locations.update(doc, { $set: { meters: [meter]} });
     this.unblock();
  }
});
