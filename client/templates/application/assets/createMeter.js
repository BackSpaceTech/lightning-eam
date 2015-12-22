Template.createMeterPage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get('idTreeView').toString());
   });
});

Template.createMeterPage.helpers({
  currentDoc: function() {
    return Locations.findOne({'id':Session.get('idTreeView').toString()});
  },
  locationFormSchema: function() {
    return Schema.locations;
  }
});

Template.createMeterPage.events({
  'click #btnCreateMeterPage': function(e) {
    var meter;
    var doc = Locations.findOne({'id':Session.get('idTreeView').toString()});
    meter = {
      text: $('#inpCreateMeterPageTitle').val(),
      id: $('#inpCreateMeterPageID').val(),
      units: $('#inpCreateMeterPageUnits').val(),
      reading: $('#inpCreateMeterPageReading').val()
    }
    Meteor.call("createMeter", doc, meter);
    FlowRouter.go('/assets/view-locations')
    return
  }
});
