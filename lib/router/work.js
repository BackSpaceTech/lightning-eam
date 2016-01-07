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

workRoutes.route('/query', {
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: function() {BlazeLayout.render("layout", {content: "workQueryPage", header: "header1", footer: "footer1"})}
});
