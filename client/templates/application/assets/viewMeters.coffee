Template.viewMetersPage.onCreated ->
  self = this;
  self.autorun ->
     self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.viewMetersPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewMetersPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewMetersPage.helpers
  customTemplate: -> Customisations.viewMeters
  currentDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current

Template.viewMetersPage.events
  'click .btnEach': (event) ->
    Collections.Locations.Current.meter = this
    $('#viewMetersPageModal1').openModal()

  'click .btnEach2': (event) ->
    Collections.Locations.Current.meter = this
    $('#viewMetersPageModal2').openModal()

  'click #viewMetersPageModal1 button': (event) ->
    doc = Collections.Locations.Current
    temp = $('#viewMetersPageModal1 input').val()
    TempArray = []
    tempArray = doc.meters
    Collections.Locations.Current.meter.reading = temp
    # find index of meter in array
    for a in [0...doc.meters.length]
      if (doc.meters[a].id == Collections.Locations.Current.meter.id)
        tempArray[a] = Collections.Locations.Current.meter
        break
    Meteor.call 'updateMeter', doc, tempArray, (error, result) ->
      if error
        toast 'error', error
      else
        toast 'success', result
      return

  'click #viewMetersPageModal2 button': (event) ->
    doc = Collections.Locations.Current
    TempArray = []
    tempArray = doc.meters;
    # find index of meter in array
    for a in [0...doc.meters.length]
      if (doc.meters[a].id == Collections.Locations.Current.meter.id)
        tempArray.splice(a,1)
        break
    Meteor.call 'updateMeter', doc, tempArray, (error, result) ->
      if error
        toast 'error', error
      else
        toast 'success', result
      return
