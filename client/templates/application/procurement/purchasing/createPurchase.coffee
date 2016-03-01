Template.createPurchasePage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'currentDoc', { reqItems: [] } # Requisition doc
  Session.set 'currentDoc2', {} # Billing Details
  Session.set 'currentDoc3', {} # Supplier Details
  Collections.Items.Current = {}

Template.createPurchasePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createPurchasePage.helpers
  customTemplate: -> Customisations.createPurchase
  formSchema: -> Schema.purchaseReqs
  insertDoc: -> Session.get 'currentDoc'
  requestor: ->
    temp = Meteor.user()
    return {
      reqBy_id: temp._id
      reqByFirstName: temp.profile.firstName
      reqByLastName: temp.profile.lastName
    }
  reqDate: -> (new Date()).toISOString()
  billingDetails: -> Session.get 'currentDoc2'
  supplierDetails: -> Session.get 'currentDoc3'
  purchaseItems: -> Session.get('currentDoc').reqItems
  settings: -> ## Purchase Items
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: '_id', hidden: true  }
        { key: 'itemID', hidden: true  }
        { key: 'type', hidden: true  }
        { key: 'referenceID', label: ' Reference ID' }
        { key: 'text', label: ' Title' }
        { key: 'orderQty', label: ' Qty' }
        { key: 'stockUnits', hidden: true  }
        { key: 'itemPrice', label: ' Price' }
        { key: 'excludesTax', label: ' Ex Tax', tmpl: Template.rtBoolean }
        { key: 'comments', label: ' Comments' }
        { key: '', label: 'Delete', tmpl: Template.rtDelete }
      ]
    }

Template.createPurchasePage.events
  'click .wo .btnAdd': (event) ->
    MaterializeModal.message
      bodyTemplate: 'createPurchaseFormAddWO'
      title: 'Add Work Order Details'
  'click .billing .btnAdd': (event) ->
    MaterializeModal.message
      bodyTemplate: 'createPurchaseFormBilling'
      title: 'Add Billing Details'
  'click .supplier .btnAdd': (event) ->
    MaterializeModal.message
      bodyTemplate: 'createPurchaseFormSupplier'
      title: 'Add Supplier Details'
  'click .items .btnAdd': (event) ->
    MaterializeModal.message
      bodyTemplate: 'createPurchaseFormItems'
      title: 'Add Items'
      callback: (error, response) ->
        if (error)
          console.error(error)
        else
          ## Check for duplicates
          temp = Session.get 'currentDoc'
          for a in [0...temp.reqItems.length]
            if (temp.reqItems[a]._id == Collections.Items.Current._id)
              toast 'error', 'Item already added!'
              return
          delete Collections.Items.Current["reactive-table-id"]
          delete Collections.Items.Current["reactive-table-sort"]
          # Read qty
          tempInput = $('#createPurchaseFormItemsOrderQty').val()
          if tempInput == '0'
            toast 'error', 'No order quantity entered!'
            return
          else
            Collections.Items.Current.orderQty = tempInput
          # Read price
          tempInput = $('#createPurchaseFormItemsPrice').val()
          if tempInput == '0'
            toast 'error', 'No item price entered!'
            return
          else
            Collections.Items.Current.itemPrice = tempInput
          # Read tax
          Collections.Items.Current.excludesTax = $('#createPurchaseFormItemsTax').is(':checked')
          # Read comments
          Collections.Items.Current.comments = $('#createPurchaseFormItemsComments').val()
          # Set goods received
          Collections.Items.Current.goodsReceived = 0
          # Update doc
          temp.reqItems.push Collections.Items.Current
          Session.set 'currentDoc', temp
  'click .items .btnDelete': (event) ->
    temp = Session.get 'currentDoc'
    for a in [0...temp.reqItems.length]
      if (temp.reqItems[a]._id == this._id)
        temp.reqItems.splice(a, 1)
        Session.set 'currentDoc', temp
        return
  'click .delivery .frmBtnDeliver .btnDeliver': (event) ->
    temp = Session.get 'currentDoc2'
    $( 'input[name="deliveryName"]' ).val(temp.tradingName)
    $( 'input[name="deliveryPhone"]' ).val(temp.phone)
    $( 'input[name="deliveryAddress"]' ).val(temp.streetAddress)
    $( 'input[name="deliveryCity"]' ).val(temp.streetCity)
    $( 'input[name="deliveryState"]' ).val(temp.streetState)
    $( 'input[name="deliveryCountry"]' ).val(temp.streetCountry)
    $( 'input[name="deliveryZip"]' ).val(temp.streetZip)
  'click .delivery .frmBtnMail .btnMail': (event) ->
    temp = Session.get 'currentDoc2'
    $( 'input[name="deliveryName"]' ).val(temp.tradingName)
    $( 'input[name="deliveryPhone"]' ).val(temp.phone)
    $( 'input[name="deliveryAddress"]' ).val(temp.postalAddress)
    $( 'input[name="deliveryCity"]' ).val(temp.postalCity)
    $( 'input[name="deliveryState"]' ).val(temp.postalState)
    $( 'input[name="deliveryCountry"]' ).val(temp.postalCountry)
    $( 'input[name="deliveryZip"]' ).val(temp.postalZip)

Template.createPurchaseFormAddWO.helpers
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: '_id', label: ' System ID' }
        { key: 'text', label: ' Title' }
        { key: 'assetID', label: ' Asset ID' }
        { key: 'assetText', label: ' Asset' }
        { key: '', label: 'Add Work Order', tmpl: Template.rtAdd }
      ]
    }

Template.createPurchaseFormAddWO.events
  'click .rtAdd .btnAdd': (event) ->
    temp = Session.get 'currentDoc'
    temp.workID = this._id
    temp.workDesc = this.text
    temp.assetID = this.assetID
    temp.assetText = this.assetText
    Session.set 'currentDoc', temp

Template.createPurchaseFormBilling.helpers
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'text', label: ' Title' }
        { key: 'name', label: ' Company Name' }
        { key: 'tradingName', label: ' Trading Name' }
        { key: 'streetCity', label: ' City' }
        { key: 'taxNumber', hidden: true }
        { key: 'phone', hidden: true }
        { key: 'streetAddress', hidden: true }
        { key: 'streetState', hidden: true }
        { key: 'streetCountry', hidden: true }
        { key: 'streetZip' , hidden: true }
        { key: 'postalAddress' , hidden: true }
        { key: 'postalCity' , hidden: true }
        { key: 'postalState' , hidden: true }
        { key: 'postalCountry' , hidden: true }
        { key: 'postalZip' , hidden: true }
        { key: '', label: 'Add', tmpl: Template.rtAdd }
      ]
    }

Template.createPurchaseFormBilling.events
  'click .rtAdd .btnAdd': (event) ->
    Session.set 'currentDoc2', this
    temp = Session.get 'currentDoc'
    temp.billing_ID = this._id
    Session.set 'currentDoc', temp

Template.createPurchaseFormSupplier.helpers
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'text', label: ' Title' }
        { key: 'name', label: ' Company Name' }
        { key: 'tradingName', label: ' Trading Name' }
        { key: 'streetCity', label: ' City' }
        { key: 'taxNumber', hidden: true }
        { key: 'phone', hidden: true }
        { key: 'streetAddress', hidden: true }
        { key: 'streetState', hidden: true }
        { key: 'streetCountry', hidden: true }
        { key: 'streetZip' , hidden: true }
        { key: 'postalAddress' , hidden: true }
        { key: 'postalCity' , hidden: true }
        { key: 'postalState' , hidden: true }
        { key: 'postalCountry' , hidden: true }
        { key: 'postalZip' , hidden: true }
        { key: '', label: 'Add', tmpl: Template.rtAdd }
      ]
    }

Template.createPurchaseFormSupplier.events
  'click .rtAdd .btnAdd': (event) ->
    Session.set 'currentDoc3', this

Template.createPurchaseFormItems.onCreated ->
  this.itemText = new ReactiveVar
  Collections.Items.Current = {}

Template.createPurchaseFormItems.helpers
  itemText: -> Template.instance().itemText.get()
  settings: -> ## Modal Items List
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: '_id', label: ' Item Sys ID' }
        { key: 'itemID', label: ' Item ID' }
        { key: 'type', label: ' Item Type' }
        { key: 'referenceID', label: ' Reference ID' }
        { key: 'text', label: ' Title' }
        { key: 'stockUnits', label: ' Units' }
        { key: '', label: 'Select', tmpl: Template.rtAdd }
      ]
    }

Template.createPurchaseFormItems.events
  'click .rtAdd .btnAdd': (event, template) ->
    Collections.Items.Current = this
    template.itemText.set this.text
