Template.viewLocationsPage.onRendered(function () {
  $(function() {
    // Initialize Treeview
    var to = false;
    $('#view_q').keyup(function() {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function() {
            var v = $('#view_q').val();
            $('#jstree_view').jstree(true).search(v);
        }, 250);
    });
    $('#jstree_view').on("changed.jstree", function (e, data) {
      if (data.selected.length!==0) {
        Session.setPersistent('currentID', data.selected);
      }
      else{
        Session.setPersistent('currentID', "#")
      }
    });
    $('#jstree_view').jstree({
      "core": {
          "animation": 0,
          "multiple" : false,
          "check_callback": true,
          "themes": {
              "stripes": true,
              "responsive": true,
              "variant" : "large"
          },
          'data' : Locations.find().fetch()
      },
      "types": {
          "#": {
              "max_children": -1,
              "max_depth": -1,
              "valid_children": -1
          },
          "default": {
              "icon": "fa fa-map-marker teal lighten-4",
              "valid_children": -1
          },
          "root" : {
               "icon" : "fa fa-flash teal lighten-4",
               "valid_children": -1
          },
          "asset" : {
               "icon" : "fa fa-industry teal lighten-4",
               "valid_children": -1
          }
      },
      "plugins": ["search", "state", "types", "wholerow"]
    });
  });
});

Template.viewLocationsPage.events({
  'click #btnViewLocationsPageNewLoc': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
    var temp = Collections.Locations.Current;
    if (!temp){ // No locations
      FlowRouter.go('/assets/create-location')
    }
    else if (temp.type === "asset"){
      alert("You cannot create a location with an asset as parent.")
    }
    else{
      FlowRouter.go('/assets/create-location')
    }
    return
  },
  'click #btnViewLocationsPageNewLoc2': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
    var temp = Collections.Locations.Current;
    if (!temp){ // No locations
      FlowRouter.go('/assets/create-location')
    }
    else if (Collections.Locations.Current.type === "asset"){
      alert("You cannot create a location with an asset as parent.")
    }
    else{
      FlowRouter.go('/assets/create-location')
    }
    return
  },
  'click #btnViewLocationsPageNewAss': function(e) {
    FlowRouter.go('/assets/create-asset')
    return
  },
  'click #btnViewLocationsPageNewAss2': function(e) {
    FlowRouter.go('/assets/create-asset')
    return
  },
  'click #btnViewLocationsPageEdit': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
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
  'click #btnViewLocationsPageEdit2': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
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
  'click #btnViewLocationsPageCopy': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
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
  },
  'click #btnViewLocationsPageCopy2': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
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
  },
  'click #btnViewLocationsPageViewLoc': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
    if (Session.get('currentID').toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Collections.Locations.Current.type === "asset"){
        FlowRouter.go('/assets/view-asset')
      }
      else{
        FlowRouter.go('/assets/view-location')
      }
    }
  },
  'click #btnViewLocationsPageViewLoc2': function(e) {
    Collections.Locations.Current = Locations.findOne({'id':Session.get('currentID').toString()});
    if (Session.get('currentID').toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      if (Collections.Locations.Current.type === "asset"){
        FlowRouter.go('/assets/view-asset')
      }
      else{
        FlowRouter.go('/assets/view-location')
      }
    }
  },
  'click #btnViewLocationsPageDeleteLoc': function(e) {
    if (Session.get('currentID').toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      FlowRouter.go('/assets/delete-location')
    }
  },
  'click #btnViewLocationsPageCreateMeter': function(e) {
    if (Session.get('currentID').toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      FlowRouter.go('/assets/create-meter')
    }
  }
});

Template.viewLocationsPage.helpers({
  locationID: function() {
    var temp = Session.get('currentID');
    var temp2 = Locations.find({id:String(temp)}).fetch();
    return (temp + " - " + temp2[0].text)
  },
  // Disable create/edit if not connected
  serverConnected: function() {
    return (Meteor.status().status === "connected");
  }
});
