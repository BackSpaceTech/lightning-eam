Template.viewAsssetPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get("idTreeView").toString());
   });
});

Template.viewAsssetPage.helpers({
  viewDoc: function() {
    return Locations.findOne({"id":Session.get("idTreeView").toString()});
  }
});
