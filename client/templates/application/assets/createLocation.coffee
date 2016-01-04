Template.createLocationPage.helpers
  customTemplate: -> Customisations.createLocation
  parentID: -> Session.get 'currentID'
  locationFormSchema: -> Schema.locations
  locationType: ->
    if (Session.get 'currentID') == '#'
      type = 'database'
    else
      type = 'location'
    return type
