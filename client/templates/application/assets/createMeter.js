Template.createMeterPage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Collections.Locations.Current.id.toString());
   });
});

Template.createMeterPage.helpers({
  currentDoc: function() {
    return Locations.findOne({'id':Collections.Locations.Current.id.toString()});
  }
});

Template.createMeterPage.events({
  'submit .new-record': function(e) {
    var meter;
    var doc = Locations.findOne({'id':Collections.Locations.Current.id.toString()});
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
