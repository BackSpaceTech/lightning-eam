Template.editLocationPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get('currentID').toString());
   });
   Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()})
});

Template.editLocationPage.helpers({
  currentDoc: function() {
    return Collections.Locations.Current;
  },
  asset: function() {
    return Collections.Locations.Current.type == "asset";
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
