Template.viewMetersPage.onCreated ->
  self = this;
  self.autorun ->
     self.subscribe 'singleLocation', (Session.get('currentID').toString())


Template.viewMetersPage.helpers
  currentDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current

Template.viewMetersPage.events
  'click .btnEach': (e) ->
    Collections.Locations.Current.meter = this
    $('#viewMetersPageModal1').openModal()

  'click .btnEach2': (e) ->
    Collections.Locations.Current.meter = this
    $('#viewMetersPageModal2').openModal()

  'click #viewMetersPageModal1 button': (e) ->
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
    Meteor.call 'updateMeter', doc, tempArray

  'click #viewMetersPageModal2 button': (e) ->
    doc = Collections.Locations.Current
    TempArray = []
    tempArray = doc.meters;
    # find index of meter in array
    for a in [0...doc.meters.length]
      if (doc.meters[a].id == Collections.Locations.Current.meter.id)
        tempArray.splice(a,1)
        break
    Meteor.call 'updateMeter', doc, tempArray
