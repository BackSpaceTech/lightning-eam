###************************* Assets routes ***********************************###

assetsRoutes = FlowRouter.group(
  prefix: '/assets'
  name: 'assets')
assetsRoutes.route '/', action: ->
  BlazeLayout.render 'layoutAssets',
    content: 'assetsPage'
    header: 'header1'
    footer: 'footer1'

assetsRoutes.route '/create-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'createLocationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/create-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'createAssetPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/edit-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'editLocationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/edit-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'editAssetPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/duplicate-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'duplicateLocationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/duplicate-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'duplicateAssetPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/delete-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'deleteLocationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/view-locations',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'viewLocationsPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/view-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'viewLocationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/view-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'viewAssetPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/create-meter',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'createMeterPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/view-meters',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'viewMetersPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/view-classifications',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'viewAssetClassificationsPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/create-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'createAssetClassificationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/edit-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'editAssetClassificationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/duplicate-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'duplicateAssetClassificationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/delete-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'deleteAssetClassificationPage'
      header: 'header1'
      footer: 'footer1'

assetsRoutes.route '/view-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutAssets',
      content: 'viewAssetClassificationPage'
      header: 'header1'
      footer: 'footer1'
