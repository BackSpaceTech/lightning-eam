Template.createMeterPage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get("idTreeView").toString());
   });
});

Template.createMeterPage.helpers({
  currentDoc: function() {
    return Locations.findOne({"id":Session.get("idTreeView").toString()});
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});

Template.createMeterPage.events({
  'submit #frmCreateMeterPage': function(e) {
    alert("Form submitted")
    return
  }
});
