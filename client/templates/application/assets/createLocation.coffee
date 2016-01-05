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
<<<<<<< HEAD

Template.createLocationPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.createLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
