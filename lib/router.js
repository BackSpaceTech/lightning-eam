
FlowRouter.notFound = {
    action: function() {BlazeLayout.render("layout", {content: "notFound", header: "header1", footer: "footer1"})}
};

FlowRouter.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "welcomePage", header: "header1", footer: "footer1"})}
});

/*********************** Assets routes ********************************/
var assetsRoutes = FlowRouter.group({
  prefix: '/assets',
  name: 'assets'
});

assetsRoutes.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "assetsPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/create-location', {
  action: function() {BlazeLayout.render("layout", {content: "createLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/create-asset', {
  action: function() {BlazeLayout.render("layout", {content: "createAssetPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/edit-location', {
  action: function() {BlazeLayout.render("layout", {content: "editLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/duplicate', {
  action: function() {BlazeLayout.render("layout", {content: "duplicateLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/delete-location', {
  action: function() {BlazeLayout.render("layout", {content: "deleteLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/view-locations', {
  action: function() {BlazeLayout.render("layout", {content: "viewLocationsPage", header: "header1", footer: "footer1"})}
});



FlowRouter.route('/signin', {
  action: function() {BlazeLayout.render("layout2", {content: "signInPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/about', {
  action: function() {BlazeLayout.render("layout", {content: "aboutPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/contracts', {
  action: function() {BlazeLayout.render("layout", {content: "contractsPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/inventory', {
  action: function() {BlazeLayout.render("layout", {content: "inventoryPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/pm', {
  action: function() {BlazeLayout.render("layout", {content: "pmPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/procurement', {
  action: function() {BlazeLayout.render("layout", {content: "procurementPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/reports', {
  action: function() {BlazeLayout.render("layout", {content: "reportsPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/resources', {
  action: function() {BlazeLayout.render("layout", {content: "resourcesPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/work', {
  action: function() {BlazeLayout.render("layout", {content: "workPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/help', {
  action: function() {BlazeLayout.render("layout", {content: "helpPage", header: "header1", footer: "footer1"})}
});

// Restricted routes
var requireLogin = function() {
  if (! Meteor.user()) {
    if (Meteor.loggingIn()) {
      this.render(this.loadingTemplate);
    } else {
      this.render('signInPage');
    }
  } else {
    this.next();
  }
}

/*Router.onBeforeAction(requireLogin, {only:[

  ]});
*/
