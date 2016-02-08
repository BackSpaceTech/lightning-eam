Template.createItemPage.onCreated ->
  this.itemClassID = new ReactiveVar

Template.createItemPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createItemPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createItemPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  locationFormSchema: -> Schema.locations
  customTemplate: -> Customisations.createItem
  itemClassID: -> Template.instance().itemClassID.get()
  txtClassificationID: ->
    temp = Classification.findOne(Template.instance().itemClassID.get().toString())
    if temp
      return temp.text

Template.createItemPage.events
  'click .firstRow .btnAdd': (event, template) ->
    Collections.Locations.CurrentID = Session.get 'currentID' # Save parent item ID
    MaterializeModal.confirm
      title: 'Select Item Classification'
      bodyTemplate: "createItemAddItemClass"
      callback: (error, response) ->
        if response.submit
          console.log "Session.get 'currentID': "+Session.get 'currentID'
          template.itemClassID.set(Session.get 'currentID') # Save selected classification ID
          Session.set 'currentID', Collections.Locations.CurrentID
          console.log "Session.get 'currentID': "+Session.get 'currentID'
        else
          Session.set 'currentID', Collections.Locations.CurrentID
        return

Template.createItemAddItemClass.onRendered ->
  Session.set 'treeviewData', 'item-classification'
  dataTree()

Template.createItemAddItemClass.helpers
  itemDetails: -> Items.find().fetch()
