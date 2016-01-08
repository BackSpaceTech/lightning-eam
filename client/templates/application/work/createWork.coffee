Template.createWorkPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}

Template.createWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createWorkPage.helpers
  customTemplate: -> Customisations.createWork
  createWorkFormSchema: -> Schema.workorders
  assetDetails: ->
  requestor: ->
    temp=Meteor.user()
    return {
      reqBy_id: temp._id
      reqByFirstName: temp.profile.firstName
      reqByLastName: temp.profile.lastName
    }
  reqDate: -> (new Date()).toISOString()
  locationID: ->
    temp = Locations.findOne {'id':Session.get('currentID').toString()}
    if (temp.assetID)
      return temp.assetID + " - " + temp.text
    return temp.text
  assetDetails: ->
    temp = Session.get 'currentID'
    return Locations.findOne {id:String(temp)}
