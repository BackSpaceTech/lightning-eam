@dataTree = (treeData, treeType) ->
  # Initialize Treeview
  to = false
  $('.view_q').keyup ->
    if to
      clearTimeout to
    to = setTimeout((->
      v = $('.view_q').val()
      $('.tree_view').jstree(true).search v
      return
    ), 250)
    return
  $('.tree_view').on 'changed.jstree', (e, data) ->
    if data.selected.length != 0
      if treeType == 'general'
        Session.set 'currentID', data.selected
      else
        Session.set 'currentClassID', data.selected
    else
      if treeType == 'general'
        Session.set 'currentID', '#'
      else
        Session.set 'currentClassID', '#'
    return
  if !treeData
    console.log 'No data source defined for treeview'
  $('.tree_view').jstree
    'core':
      'animation': 0
      'multiple': false
      'check_callback': true
      'themes':
        'stripes': true
        'responsive': true
        'variant': 'large'
      'check_callback' : true
      'data': treeData
    'types':
      '#':
        'max_children': -1
        'max_depth': -1
        'valid_children': -1
      'default':
        'icon': 'fa fa-map-marker teal lighten-4'
        'valid_children': -1
      'root':
        'icon': 'fa fa-flash teal lighten-4'
        'valid_children': -1
      'asset':
        'icon': 'fa fa-industry teal lighten-4'
        'valid_children': -1
      'asset-classification':
        'icon': 'fa fa-sitemap teal lighten-4'
        'valid_children': -1
      'item-classification':
        'icon': 'fa fa-sitemap teal lighten-4'
        'valid_children': -1
      'database':
        'icon': 'fa fa-database teal lighten-4'
        'valid_children': -1
    'plugins': [
      'search'
      'state'
      'types'
      'wholerow'
    ]
  return
