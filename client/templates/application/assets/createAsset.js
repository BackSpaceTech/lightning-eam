Template.insertAssetForm.helpers({
  parentID: function() {
    return Session.get("idTreeView");
  },
  locType: function() {
    return "asset";
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
