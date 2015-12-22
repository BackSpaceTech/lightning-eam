Template.insertLocationForm.helpers({
  parentID: function() {
    return Collections.Locations.Current.id;
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
