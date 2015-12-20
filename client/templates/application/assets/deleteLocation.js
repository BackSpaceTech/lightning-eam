Template.deleteLocationPage.helpers({
  deleteDoc: function() {
    return Locations.findOne({"id":Session.get("idTreeView").toString()});
  }
});

Template.deleteLocationPage.events({
  'click #btnDeleteLoc': function(e) {
    var temp = Locations.findOne({"id":Session.get("idTreeView").toString()});
    Meteor.call("deleteLoc", temp._id);
  }
});
