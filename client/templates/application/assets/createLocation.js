Template.insertLocationForm.helpers({
  parentID: function() {
    var temp = Session.get("idTreeView");
    if (temp == ""){
      temp = "#";
    }
    return temp;
  },
  locType: function() {
    return "location";
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});
