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
      Session.set("idTreeView",data.selected);
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
    if (Session.get("isAsset")===true){
      alert("You cannot create a location with an asset as parent.")
    }
    else{
      Session.set("formContext","newLoc");
      FlowRouter.go('/assets/create-location')
    }
    return
  },
  'click #newAsset': function(e) {
    Session.set("formContext","newAsset");
  },
  'click #editLoc': function(e) {
    Session.set("formContext","editLoc");
  },
  'click #deleteLoc': function(e) {
    Session.set("formContext","deleteLoc");
  }
});

Template.viewLocationsPage.helpers({
  locationDetails: function() {
    var temp = Session.get("idTreeView");
    var temp2 = Locations.find({id:String(temp)}).fetch();
    if (temp2[0].type=='location'){
      temp3 = 'Location '+ temp;
      Session.set("isAsset",false);
    }
    else{
      temp3 = 'Asset ' + temp;
      Session.set("isAsset",true);
    }
    return (temp3 + " - " + temp2[0].text)
  },
  // Disable create/edit if not connected
  serverConnected: function() {
    return (Meteor.status().status === "connected");
  }
});
