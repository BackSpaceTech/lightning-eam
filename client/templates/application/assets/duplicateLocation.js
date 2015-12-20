Template.duplicateLocationPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get("idTreeView").toString());
   });
});

Template.duplicateLocationPage.helpers({
  duplicateDoc: function() {
    return Locations.findOne({"id":Session.get("idTreeView").toString()});
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
