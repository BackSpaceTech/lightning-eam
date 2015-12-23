Template.insertLocationForm.helpers({
  parentID: function() {
    return Session.get('currentID');
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
