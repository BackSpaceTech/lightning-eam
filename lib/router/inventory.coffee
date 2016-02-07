###************************* Assets routes ***********************************###

inventoryRoutes = FlowRouter.group(
  prefix: '/inventory'
  name: 'inventory')

inventoryRoutes.route '/', action: ->
  BlazeLayout.render 'layoutInventory',
    content: 'inventoryPage'
    header: 'header1'
    footer: 'footer1'

inventoryRoutes.route '/item/view-classifications',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'viewItemClassificationsPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/item/view-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'viewItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/item/create-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'createItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/item/edit-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'editItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/item/duplicate-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'duplicateItemClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/item/delete-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'deleteItemClassificationPage'
      header: 'header1'
      footer: 'footer1'
