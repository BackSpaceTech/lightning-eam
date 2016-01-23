Template.createPMPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}

Template.createPMPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createPMPage.helpers
  customTemplate: -> Customisations.createPM
  createWorkFormSchema: -> Schema.requests
  requestor: ->
    temp=Meteor.user()
    return {
      reqBy_id: temp._id
      reqByFirstName: temp.profile.firstName
      reqByLastName: temp.profile.lastName
    }
  pmDate: -> (new Date()).toISOString()
  assetDetails: ->
    temp = Session.get 'currentID'
    return Locations.findOne {id:String(temp)}
