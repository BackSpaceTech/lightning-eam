// Initialize Treeview
Template.viewLocationsPage.onRendered(function () {
  $(function() {
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
            "root": {
                "icon": "/tree_icon.png",
                "valid_children": -1
            },
            "default": {
                "valid_children": -1
            },
            "file": {
                "icon": "glyphicon glyphicon-file",
                "valid_children": -1
            }
        },
        "plugins": ["contextmenu", "dnd", "search", "state", "types", "wholerow"]
    });
  });
});

Template.viewLocationsPage.events({
  'click #newLoc': function(e) {
    Session.set("formContext","newLoc");
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
    return (temp + " - " + temp2[0].text)
  }
});
