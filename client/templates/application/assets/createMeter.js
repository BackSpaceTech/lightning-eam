Template.createMeterPage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get('currentID').toString());
   });
   Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
});

Template.createMeterPage.helpers({
  currentDoc: function() {
    return Collections.Locations.Current;
  }
});

Template.createMeterPage.events({
  'submit .new-record': function(e) {
    var meter;
    var doc = Collections.Locations.Current;
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
