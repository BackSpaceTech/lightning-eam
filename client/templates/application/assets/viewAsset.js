Template.viewAssetPage.onCreated(function() {
  var self = this;
   self.autorun(function() {
     self.subscribe('singleLocation', Session.get('currentID').toString());
   });
   Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()})
});

Template.viewAssetPage.helpers({
  viewDoc: function() {
    return Collections.Locations.Current;
  },
  meterValue: function() {
    console.log(JSON.stringify(this))
    return this.reading;
  }
});

Template.viewAssetPage.events({
  'click #btnViewAssetPageEdit': function(e) {
    if (Session.get('currentID').toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Collections.Locations.Current.type === "asset"){
        FlowRouter.go('/assets/edit-asset')
      }
      else{
        FlowRouter.go('/assets/edit-location')
      }
    }
  },
  'click #btnViewAssetPageCopy': function(e) {
    if (Session.get('currentID').toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Collections.Locations.Current.type === "asset"){
        FlowRouter.go('/assets/duplicate-asset')
      }
      else{
        FlowRouter.go('/assets/duplicate-location')
      }
    }
  }
});
