Template.smlDateField.helpers
  dateItem: ->
    if this.item
      dateObj = this.item
      day = dateObj.getDate()
      month = dateObj.getMonth() + 1
      year = dateObj.getFullYear()
      day + '/' + month + '/' + year
