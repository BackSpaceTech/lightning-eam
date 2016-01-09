###************************* Assets routes ***********************************###

assetsRoutes = FlowRouter.group(
  prefix: '/assets'
  name: 'assets')
assetsRoutes.route '/', action: ->
  BlazeLayout.render 'layout',
    content: 'assetsPage'
    header: 'header1'
    footer: 'footer1'
  return
assetsRoutes.route '/create-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'createLocationPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/create-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'createAssetPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/edit-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'editLocationPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/edit-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'editAssetPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/duplicate-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'duplicateLocationPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/duplicate-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'duplicateAssetPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/delete-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'deleteLocationPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/view-locations',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewLocationsPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/view-location',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewLocationPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/view-asset',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewAssetPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/create-meter',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'createMeterPage'
      header: 'header1'
      footer: 'footer1'
    return
assetsRoutes.route '/view-meters',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewMetersPage'
      header: 'header1'
      footer: 'footer1'
    return
