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
        Session.set("idTreeView",data.selected);
      }
      else{
        Session.set("idTreeView","#");
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
  'click #newLoc': function(e) {
    var temp = Locations.findOne({"id":Session.get("idTreeView").toString()});
    if (!temp){ // No locations
      FlowRouter.go('/assets/create-location')
    }
    else if (Locations.findOne({"id":Session.get("idTreeView").toString()}).type === "asset"){
      alert("You cannot create a location with an asset as parent.")
    }
    else{
      FlowRouter.go('/assets/create-location')
    }
    return
  },
  'click #newLoc2': function(e) {
    var temp = Locations.findOne({"id":Session.get("idTreeView").toString()});
    if (!temp){ // No locations
      FlowRouter.go('/assets/create-location')
    }
    else if (Locations.findOne({"id":Session.get("idTreeView").toString()}).type === "asset"){
      alert("You cannot create a location with an asset as parent.")
    }
    else{
      FlowRouter.go('/assets/create-location')
    }
    return
  },
  'click #newAss': function(e) {
    FlowRouter.go('/assets/create-asset')
    return
  },
  'click #newAss2': function(e) {
    FlowRouter.go('/assets/create-asset')
    return
  },
  'click #editLoc': function(e) {
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
  'click #editLoc2': function(e) {
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
  'click #copyLoc': function(e) {
    if (Session.get("idTreeView").toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      FlowRouter.go('/assets/duplicate')
    }
  },
  'click #copyLoc2': function(e) {
    if (Session.get("idTreeView").toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      FlowRouter.go('/assets/duplicate')
    }
  },  
  'click #deleteLoc': function(e) {
    if (Session.get("idTreeView").toString()=== "#"){
      alert("No location or asset selected!")
    }
    else{
      FlowRouter.go('/assets/delete-location')
    }
  }
});

Template.viewLocationsPage.helpers({
  locationID: function() {
    var temp = Session.get("idTreeView");
    var temp2 = Locations.find({id:String(temp)}).fetch();
    return (temp + " - " + temp2[0].text)
  },
  // Disable create/edit if not connected
  serverConnected: function() {
    return (Meteor.status().status === "connected");
  }
});
