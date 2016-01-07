Template.viewWorkPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'quickSearch', true

Template.viewWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewWorkPage.helpers
  quickSearch: -> Session.get 'quickSearch'
  locationID: ->
    temp = Locations.findOne {'id':Session.get('currentID').toString()}
    if (temp.assetID)
      return temp.assetID + " - " + temp.text
    return temp.text

Template.viewWorkPage.events
  'click #swtViewWork1': -> Session.set 'quickSearch', !$('#swtViewWork1').prop('checked')

Template.viewWorkAdvanced.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}
  $('.datepicker').pickadate {
    selectMonths: true
    selectYears: 15
    }
