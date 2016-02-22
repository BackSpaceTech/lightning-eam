Template.createWorkPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  temp = Locations.find().fetch()
  dataTree(temp , 'general')

Template.createWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createWorkPage.helpers
  customTemplate: -> Customisations.createWork
  createWorkFormSchema: -> Schema.requests
  requestor: ->
    temp=Meteor.user()
    return {
      reqBy_id: temp._id
      reqByFirstName: temp.profile.firstName
      reqByLastName: temp.profile.lastName
    }
  reqDate: -> (new Date()).toISOString()
  assetDetails: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    Collections.Locations.Current
