Template.duplicateLocationPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get('currentID').toString());
   });
   Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()})
});

Template.duplicateLocationPage.helpers({
  duplicateDoc: function() {
    return Collections.Locations.Current;
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
