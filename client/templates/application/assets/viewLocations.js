// Initialize Treeview
Template.viewLocationsPage.onRendered(function () {
  $(function() {
      var to = false;
      $('#demo_q').keyup(function() {
          if (to) {
              clearTimeout(to);
          }
          to = setTimeout(function() {
              var v = $('#demo_q').val();
              $('#jstree_demo').jstree(true).search(v);
          }, 250);
      });
      $('#jstree_demo').jstree({
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
    'click #createLoc': function(e) {
        var ref = $('#jstree_demo').jstree(true),
            sel = ref.get_selected();
        if (!sel.length) {
            return false;
        }
        sel = sel[0];
        sel = ref.create_node(sel, {
            "type": "file"
        });
        if (sel) {
            ref.edit(sel);
        }
    },
    'click #editLoc': function(e) {
        var ref = $('#jstree_demo').jstree(true),
            sel = ref.get_selected();
        if (!sel.length) {
            return false;
        }
        sel = sel[0];
        ref.edit(sel);
    },
    'click #deleteLoc': function(e) {
      var ref = $('#jstree_demo').jstree(true),
          sel = ref.get_selected();
      if (!sel.length) {
          return false;
      }
      ref.delete_node(sel);
    }
});
