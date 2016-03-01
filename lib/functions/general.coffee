# Convert Date objects to a string phrase
@dateToText = (dateObj) ->
  day = dateObj.getDate()
  month = Lists.Months[dateObj.getMonth()]
  year = dateObj.getFullYear()
  day + ' ' + month + ' ' + year
