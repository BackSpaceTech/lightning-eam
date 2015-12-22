Template.deleteLocationPage.helpers({
  deleteDoc: function() {
    return Locations.findOne({"id":Collections.Locations.Current.id.toString()});
  }
});

Template.deleteLocationPage.events({
  'click button': function(e) {
    // Check for children
    var temp = Locations.findOne({"parent":Collections.Locations.Current.id.toString()})
    if (temp){
      alert("You cannot delete an asset or location that has children!");
    }
    else{
      temp = Locations.findOne({"id":Collections.Locations.Current.id.toString()});
      Meteor.call("deleteLoc", temp._id);
    }
    FlowRouter.go('/assets/view-locations')
    return
  }
});
