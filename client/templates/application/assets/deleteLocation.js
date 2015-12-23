Template.deleteLocationPage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get('currentID').toString());
   });
   Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
});

Template.deleteLocationPage.helpers({
  deleteDoc: function() {
    return Collections.Locations.Current;
  }
});

Template.deleteLocationPage.events({
  'click button': function(e) {
    // Check for children
    var temp = Locations.findOne({"parent":Session.get('currentID').toString()})
    if (temp){
      alert("You cannot delete an asset or location that has children!");
    }
    else{
      temp = Collections.Locations.Current;
      Meteor.call("deleteLoc", temp._id);
    }
    FlowRouter.go('/assets/view-locations')
    return
  }
});
