Template.duplicateLocationPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Collections.Locations.Current.id.toString());
   });
});

Template.duplicateLocationPage.helpers({
  duplicateDoc: function() {
    return Locations.findOne({"id":Collections.Locations.Current.id.toString()});
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
