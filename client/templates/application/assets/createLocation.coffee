Template.createLocationPage.helpers
  customTemplate: -> Customisations.Index.createLocation
  parentID: -> Session.get 'currentID'
  locationFormSchema: -> Schema.locations
  locationType: ->
    if (Session.get 'currentID') == '#'
      type = 'database'
    else
      type = 'location'
    return type
