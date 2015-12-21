Template.viewLocationPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get("idTreeView").toString());
   });
});

Template.viewLocationPage.helpers({
  viewDoc: function() {
    return Locations.findOne({"id":Session.get("idTreeView").toString()});
  }
});

Template.viewLocationPage.events({
  'click #btnViewLocationPageEdit': function(e) {
    if (Session.get("idTreeView").toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Locations.findOne({"id":Session.get("idTreeView").toString()}).type === "asset"){
        FlowRouter.go('/assets/edit-asset')
      }
      else{
        FlowRouter.go('/assets/edit-location')
      }
    }
  },
  'click #btnViewLocationPageCopy': function(e) {
    if (Session.get("idTreeView").toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Locations.findOne({"id":Session.get("idTreeView").toString()}).type === "asset"){
        FlowRouter.go('/assets/duplicate-asset')
      }
      else{
        FlowRouter.go('/assets/duplicate-location')
      }
    }
  }
});
