angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    
  

      .state('menu', {
    url: '/',
    templateUrl: 'templates/menu.html',
    controller: 'menuCtrl'
  })

  .state('myc_menuLogin', {
    url: '/myc_menu-login',
    templateUrl: 'templates/myc_menuLogin.html',
    controller: 'myc_menuLoginCtrl'
  })

  .state('myc_menuAnime', {
    url: '/myc_menu-anime',
    templateUrl: 'templates/myc_menuAnime.html',
    controller: 'myc_menuAnimeCtrl'
  })

  .state('myc_menuSide_menus', {
    url: '/myc_menu-side_menus',
    templateUrl: 'templates/myc_menuSide_menus.html',
    controller: 'myc_menuSide_menusCtrl'
  })

  .state('myc_menuNews', {
    url: '/myc_menu-news',
    templateUrl: 'templates/myc_menuNews.html',
    controller: 'myc_menuNewsCtrl'
  })

  .state('myc_menuSupport', {
    url: '/myc_menu-support',
    templateUrl: 'templates/myc_menuSupport.html',
    controller: 'myc_menuSupportCtrl'
  })

  .state('myc_menuLibrary', {
    url: '/page9',
    templateUrl: 'templates/myc_menuLibrary.html',
    controller: 'myc_menuLibraryCtrl'
  })

  .state('myc_menuGrades', {
    url: '/myc_menu-grades',
    templateUrl: 'templates/myc_menuGrades.html',
    controller: 'myc_menuGradesCtrl'
  })

  .state('myc_menuMain', {
    url: '/myc_menu-main',
    templateUrl: 'templates/myc_menuMain.html',
    controller: 'myc_menuMainCtrl'
  })

$urlRouterProvider.otherwise('')

  

});