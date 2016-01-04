Template.createWorkPage.onRendered ->
  assetTree()


Template.createWorkPage.events



Template.createWorkPage.helpers
  customTemplate: -> Customisations.Index.createWork
  locationID: ->
    temp = Session.get 'currentID'
    temp2 = Locations.find({id:String(temp)}).fetch();
    return (temp + ' - ' + temp2[0].text)

  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected');
