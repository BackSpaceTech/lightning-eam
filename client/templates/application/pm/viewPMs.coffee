Template.viewPMsPage.onCreated ->
  this.subscribe 'pm'

Template.viewPMsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewPMsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewPMsPage.helpers
  customTemplate: -> Customisations.viewPMs
  collectionPM: -> PM
  settings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'assetGroupDetails', label: ' Asset Group' }
      { key: 'pmDescription', label: ' PM Description' }
    ]
  }

Template.viewPMsPage.events
  'click .viewPMs .btnAdd': (e) ->
    alert JSON.stringify PM.findOne()
