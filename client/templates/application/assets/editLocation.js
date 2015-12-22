Template.editLocationPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Collections.Locations.Current.id.toString());
   });
});

Template.editLocationPage.helpers({
  currentDoc: function() {
    return Locations.findOne({"id":Collections.Locations.Current.id.toString()});
  },
  asset: function() {
    alert(Locations.findOne({"id":Collections.Locations.Current.id}).type)
    return Locations.findOne({"id":Collections.Locations.Current.id}).type == "asset";
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
