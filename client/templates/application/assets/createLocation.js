Template.insertLocationForm.helpers({
  parentID: function() {
    return Session.get("idTreeView");
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
