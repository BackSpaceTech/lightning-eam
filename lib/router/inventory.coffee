###************************* Assets routes ***********************************###

inventoryRoutes = FlowRouter.group(
  prefix: '/inventory'
  name: 'inventory')

inventoryRoutes.route '/', action: ->
  BlazeLayout.render 'layout',
    content: 'inventoryPage'
    header: 'header1'
    footer: 'footer1'

inventoryRoutes.route '/view-item-classifications',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewItemClassificationsPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/view-item-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/create-item-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'createItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/edit-item-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'editItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/duplicate-item-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'duplicateItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/delete-item-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'deleteItemClassificationPage'
      header: 'header1'
      footer: 'footer1'
