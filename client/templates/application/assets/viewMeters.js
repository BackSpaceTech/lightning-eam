Template.viewMetersPage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Collections.Locations.Current.id.toString());
   });
});

Template.viewMetersPage.helpers({
  currentDoc: function() {
    return Locations.findOne({'id':Collections.Locations.Current.id.toString()});
  }
});

Template.viewMetersPage.events({
  'click .btnEach': function(e) {
    Collections.Locations.Current.meter = this;
    $('#viewMetersPageModal1').openModal();
  },
  'click .btnEach2': function(e) {
    Collections.Locations.Current.meter = this;
    $('#viewMetersPageModal2').openModal();
  },
  'click #viewMetersPageModal1 button': function(e) {
    var doc = Locations.findOne({'id':Collections.Locations.Current.id.toString()});
    var temp = $("#viewMetersPageModal1 input").val();
    var TempArray = [];
    tempArray = doc.meters;
    Collections.Locations.Current.meter.reading = temp;
    // find index of meter in array
    for(a=0;a<doc.meters.length;a++){
      if (doc.meters[a].id === Collections.Locations.Current.meter.id){
        tempArray[a] = Collections.Locations.Current.meter;
        break;
      }
    }
    Meteor.call("updateMeter", doc, tempArray);
  },
  'click #viewMetersPageModal2 button': function(e) {
    var doc = Locations.findOne({'id':Collections.Locations.Current.id.toString()});
    var TempArray = [];
    tempArray = doc.meters;
    // find index of meter in array
    for(a=0;a<doc.meters.length;a++){
      if (doc.meters[a].id === Collections.Locations.Current.meter.id){
        tempArray.splice(a,1);
        break;
      }
    }
    Meteor.call("updateMeter", doc, tempArray);
  }
});
