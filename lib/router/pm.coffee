pmRoutes = FlowRouter.group(
  prefix: '/pm'
  name: 'pm')
pmRoutes.route '/', action: ->
  BlazeLayout.render 'layout',
    content: 'pmPage'
    header: 'header1'
    footer: 'footer1'

pmRoutes.route '/view-groups',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'assetGroupsPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/create-group',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'createAssetGroupPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/view-group',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewAssetGroupPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/edit-group',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'editAssetGroupPage'
      header: 'header1'
      footer: 'footer1'
