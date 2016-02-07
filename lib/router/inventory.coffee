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

inventoryRoutes.route '/equipment/view-classifications',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'viewEquipmentClassificationsPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/equipment/view-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'viewEquipmentClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/equipment/create-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'createEquipmentClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/equipment/edit-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'editEquipmentClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/equipment/duplicate-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'duplicateEquipmentClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/equipment/delete-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutInventory',
      content: 'deleteEquipmentClassificationPage'
      header: 'header1'
      footer: 'footer1'

inventoryRoutes.route '/locations/view-classifications',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutInventory',
    content: 'viewInvLocClassificationsPage'
    header: 'header1'
    footer: 'footer1'

inventoryRoutes.route '/locations/view-classification',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutInventory',
    content: 'viewInvLocClassificationPage'
    header: 'header1'
    footer: 'footer1'

inventoryRoutes.route '/locations/create-classification',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutInventory',
    content: 'createInvLocClassificationPage'
    header: 'header1'
    footer: 'footer1'

inventoryRoutes.route '/locations/edit-classification',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutInventory',
    content: 'editInvLocClassificationPage'
    header: 'header1'
    footer: 'footer1'

inventoryRoutes.route '/locations/duplicate-classification',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutInventory',
    content: 'duplicateInvLocClassificationPage'
    header: 'header1'
    footer: 'footer1'

inventoryRoutes.route '/locations/delete-classification',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutInventory',
    content: 'deleteInvLocClassificationPage'
    header: 'header1'
    footer: 'footer1'
