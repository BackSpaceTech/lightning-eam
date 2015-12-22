Template.editAssetPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Collections.Locations.Current.id.toString());
   });
});

Template.editAssetPage.helpers({
  currentDoc: function() {
    return Locations.findOne({"id":Collections.Locations.Current.id.toString()});
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
