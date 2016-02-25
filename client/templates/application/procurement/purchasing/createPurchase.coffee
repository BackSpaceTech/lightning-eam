Template.createPurchasePage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'currentDoc', {}
  Session.set 'currentDoc2', {}
  Session.set 'currentDoc3', {}

Template.createPurchasePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createPurchasePage.helpers
  customTemplate: -> Customisations.createPurchase
  formSchema: -> Schema.purchaseReqs
  requestor: ->
    temp=Meteor.user()
    return {
      reqBy_id: temp._id
      reqByFirstName: temp.profile.firstName
      reqByLastName: temp.profile.lastName
    }
  reqDate: -> (new Date()).toISOString()
  workDetails: -> Session.get 'currentDoc'
  billingDetails: -> Session.get 'currentDoc2'
  supplierDetails: -> Session.get 'currentDoc3'

Template.createPurchasePage.events
  'click .wo .btnAdd': (event) ->
    MaterializeModal.display {
      bodyTemplate: 'createPurchaseFormAddWO'
      title: 'Add Work Order Details'
    }
  'click .billing .btnAdd': (event) ->
    MaterializeModal.display {
      bodyTemplate: 'createPurchaseFormBilling'
      title: 'Add Billing Details'
    }
  'click .supplier .btnAdd': (event) ->
    MaterializeModal.display {
      bodyTemplate: 'createPurchaseFormSupplier'
      title: 'Add Supplier Details'
    }
  'click .delivery .frmBtnDeliver .btnIcon': (event) ->
    temp = Session.get 'currentDoc2'
    $( 'input[name="deliveryName"]' ).val(temp.tradingName)
    $( 'input[name="deliveryPhone"]' ).val(temp.phone)
    $( 'input[name="deliveryAddress"]' ).val(temp.streetAddress)
    $( 'input[name="deliveryCity"]' ).val(temp.streetCity)
    $( 'input[name="deliveryState"]' ).val(temp.streetState)
    $( 'input[name="deliveryCountry"]' ).val(temp.streetCountry)
    $( 'input[name="deliveryZip"]' ).val(temp.streetZip)
  'click .delivery .frmBtnMail .btnIcon': (event) ->
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
        { key: 'location', label: 'Add Work Order', tmpl: Template.rtAdd }
      ]
    }

Template.createPurchaseFormAddWO.events
  'click .rtAdd .btnAdd': (event) ->
    Session.set 'currentDoc', this

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
        { key: 'location', label: 'Add', tmpl: Template.rtAdd }
      ]
    }

Template.createPurchaseFormBilling.events
  'click .rtAdd .btnAdd': (event) ->
    Session.set 'currentDoc2', this

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
        { key: 'location', label: 'Add', tmpl: Template.rtAdd }
      ]
    }

Template.createPurchaseFormSupplier.events
  'click .rtAdd .btnAdd': (event) ->
    Session.set 'currentDoc3', this
