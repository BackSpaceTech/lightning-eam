Template.smlDateField.helpers
  dateItem: ->
    if this.item
      dateObj = this.item
      day = dateObj.getDate()
      month = Lists.Months[dateObj.getMonth()]
      year = dateObj.getFullYear()
      day + ' ' + month + ' ' + year
