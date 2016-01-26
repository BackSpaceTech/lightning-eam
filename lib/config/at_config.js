// Options
AccountsTemplates.configure({
    defaultTemplate: 'signInPage',
    defaultLayout: 'layoutSignIn',
    defaultLayoutRegions: {
        header: 'header1',
        footer: 'footer1'
    },
    defaultContentRegion: 'content',

    //defaultLayout: 'emptyLayout',
    showForgotPasswordLink: true,
    overrideLoginErrors: true,
    enablePasswordChange: true,
    //sendVerificationEmail: true,

    //enforceEmailVerification: true,
    //confirmPassword: true,
    //continuousValidation: false,
    //displayFormLabels: true,
    //forbidClientAccountCreation: false,
    //formValidationFeedback: true,
    //homeRoutePath: '/',
    //showAddRemoveServices: false,
    //showPlaceholders: true,

    negativeValidation: true,
    positiveValidation:true,
    negativeFeedback: false,
    positiveFeedback:true,

    // Privacy Policy and Terms of Use
    //privacyUrl: 'privacy',
    //termsUrl: 'terms-of-use',

});

AccountsTemplates.addFields([
    {
      _id: "firstName",
      type: "text",
      displayName: "First Name",
      required: true
    },
    {
      _id: "lastName",
      type: "text",
      displayName: "Last Name",
      required: true
    }
]);

//Routes
AccountsTemplates.configureRoute('changePwd');
AccountsTemplates.configureRoute('forgotPwd');
AccountsTemplates.configureRoute('resetPwd');
AccountsTemplates.configureRoute('enrollAccount');
AccountsTemplates.configureRoute('signIn');
AccountsTemplates.configureRoute('signUp');
AccountsTemplates.configureRoute('verifyEmail');
