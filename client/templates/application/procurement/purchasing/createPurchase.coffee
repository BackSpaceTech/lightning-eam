Template.createPurchasePage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  temp = Locations.find().fetch()
  dataTree(temp , 'general')

Template.createPurchasePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createPurchasePage.helpers
  customTemplate: -> Customisations.createPurchase
  formSchema: -> Schema.purchaseReqs
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
