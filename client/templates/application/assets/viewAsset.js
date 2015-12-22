Template.viewAssetPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Collections.Locations.Current.id.toString());
   });
});

Template.viewAssetPage.helpers({
  viewDoc: function() {
    return Locations.findOne({"id": Collections.Locations.Current.id.toString()});
  },
  meterValue: function() {
    console.log(JSON.stringify(this))
    return this.reading;
  }
});

Template.viewAssetPage.events({
  'click #btnViewAssetPageEdit': function(e) {
    if (Collections.Locations.Current.id.toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Locations.findOne({"id":Collections.Locations.Current.id.toString()}).type === "asset"){
        FlowRouter.go('/assets/edit-asset')
      }
      else{
        FlowRouter.go('/assets/edit-location')
      }
    }
  },
  'click #btnViewAssetPageCopy': function(e) {
    if (Collections.Locations.Current.id.toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Locations.findOne({"id":Collections.Locations.Current.id.toString()}).type === "asset"){
        FlowRouter.go('/assets/duplicate-asset')
      }
      else{
        FlowRouter.go('/assets/duplicate-location')
      }
    }
  }
});
