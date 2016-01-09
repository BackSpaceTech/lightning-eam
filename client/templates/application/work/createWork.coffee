Template.createWorkPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}

Template.createWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createWorkPage.helpers
  customTemplate: -> Customisations.createWork
  createWorkFormSchema: -> Schema.workorders
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
    return Locations.findOne {id:String(temp)}
