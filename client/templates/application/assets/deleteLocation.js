Template.deleteLocationPage.helpers({
  deleteDoc: function() {
    return Locations.findOne({"id":Session.get("idTreeView").toString()});
  }
});

Template.deleteLocationPage.events({
  'click #btnDeleteLocationPage': function(e) {
    // Check for children
    var temp = Locations.findOne({"parent":Session.get("idTreeView").toString()})
    if (temp){
      alert("You cannot delete an asset or location that has children!");
    }
    else{
      temp = Locations.findOne({"id":Session.get("idTreeView").toString()});
      Meteor.call("deleteLoc", temp._id);
    }
    return
  }
});
