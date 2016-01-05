Template.createWorkPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}

Template.createWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createWorkPage.events



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
  reqDate: -> new Date()
  assetDetails: ->
    temp = Session.get 'currentID'
    temp2 = Locations.findOne({id:String(temp)});
    return {
      _id: temp2._id
      id: temp2.id
      text: temp2.text
    }
