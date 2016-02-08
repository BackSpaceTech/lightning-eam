Template.createWorkPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  dataTree()  

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
    temp = Session.get 'currentID'
    Locations.findOne {id:String(temp)}
