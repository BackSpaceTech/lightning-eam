if(Meteor.isClient){
  assetTree = function(){
    // Initialize Treeview
    var to = false;
    $('.view_q').keyup(function() {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function() {
            var v = $('.view_q').val();
            $('.tree_view').jstree(true).search(v);
        }, 250);
    });
    $('.tree_view').on('changed.jstree', function (e, data) {
      if (data.selected.length!==0) {
        Session.set('currentID', data.selected);
      }
      else{
        Session.set('currentID', '#')
      }
    });
    $('.tree_view').jstree({
      'core': {
          'animation': 0,
          'multiple' : false,
          'check_callback': true,
          'themes': {
              'stripes': true,
              'responsive': true,
              'variant' : 'large'
          },
          'data' : Locations.find().fetch()
      },
      'types': {
          '#': {
              'max_children': -1,
              'max_depth': -1,
              'valid_children': -1
          },
          'default': {
              'icon': 'fa fa-map-marker teal lighten-4',
              'valid_children': -1
          },
          'root' : {
               'icon' : 'fa fa-flash teal lighten-4',
               'valid_children': -1
          },
          'asset' : {
               'icon' : 'fa fa-industry teal lighten-4',
               'valid_children': -1
          }
          ,
          'database' : {
               'icon' : 'fa fa-database teal lighten-4',
               'valid_children': -1
          }
      },
      'plugins': ['search', 'state', 'types', 'wholerow']
    });
  }
}
