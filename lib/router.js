
FlowRouter.notFound = {
    action: function() {BlazeLayout.render("layout", {content: "notFound", header: "header1", footer: "footer1"})}
};

FlowRouter.route('/signin', {
  action: function() {BlazeLayout.render("layout2", {content: "signInPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "welcomePage", header: "header1", footer: "footer1"})}
});

/************************** Assets routes ************************************/
var assetsRoutes = FlowRouter.group({
  prefix: '/assets',
  name: 'assets'
});

assetsRoutes.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "assetsPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/create-location', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "createLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/create-asset', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "createAssetPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/edit-location', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "editLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/edit-asset', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "editAssetPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/duplicate-location', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "duplicateLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/duplicate-asset', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "duplicateAssetPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/delete-location', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "deleteLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/view-locations', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "viewLocationsPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/view-location', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "viewLocationPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/view-asset', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "viewAssetPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/create-meter', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "createMeterPage", header: "header1", footer: "footer1"})}
});

assetsRoutes.route('/view-meters', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "viewMetersPage", header: "header1", footer: "footer1"})}
});


/************************** Resources routes ************************************/
var resourcesRoutes = FlowRouter.group({
  prefix: '/resources',
  name: 'resources'
});

resourcesRoutes.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "resourcesPage", header: "header1", footer: "footer1"})}
});

resourcesRoutes.route('/view-people', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "viewPeoplePage", header: "header1", footer: "footer1"})}
});

resourcesRoutes.route('/edit-people', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "editPeoplePage", header: "header1", footer: "footer1"})}
});

resourcesRoutes.route('/credentials', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "credentialsPage", header: "header1", footer: "footer1"})}
});

/************************** Work routes ************************************/
var workRoutes = FlowRouter.group({
  prefix: '/work',
  name: 'work'
});

workRoutes.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "workPage", header: "header1", footer: "footer1"})}
});

workRoutes.route('/create', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "createWorkPage", header: "header1", footer: "footer1"})}
});

workRoutes.route('/view', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "viewWorkPage", header: "header1", footer: "footer1"})}
});

/************************** Other routes ************************************/

FlowRouter.route('/about', {
  action: function() {BlazeLayout.render("layout", {content: "aboutPage", header: "header1", footer: "footer1"})}
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

FlowRouter.route('/help', {
  action: function() {BlazeLayout.render("layout", {content: "helpPage", header: "header1", footer: "footer1"})}
});
