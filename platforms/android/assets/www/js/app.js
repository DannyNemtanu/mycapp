// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('starter', ['ionic','starter.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.cordova && window.cordova.plugins.Keyboard) {
      // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      // for form inputs)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);

      // Don't remove this line unless you know what you are doing. It stops the viewport
      // from snapping when text inputs are focused. Ionic handles this internally for
      // a much nicer keyboard experience.
      cordova.plugins.Keyboard.disableScroll(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})



.config(function($stateProvider,$urlRouterProvider){
  $stateProvider

  .state('tab',{
    url:'/tab',
    abstract:true,
    cache:false,
                controller:'AppCtrl',
    templateUrl:function(){

      if(sessionStorage.getItem('loggedin_status')){
        return 'main.html';
      }else{
        return 'login.html';
          
      }

    }
  })

  .state('tab.index',{
    url:'/index',
    views:{
      'tab-index':{
          templateUrl:'index.html'
      }
    }
  })


  .state('tab.login',{
    url:'/login',
    views:{
      'tab-login':{
          templateUrl:'login.html',
          controller:'AppCtrl'
      }
    }
  })


  .state('tab.main',{
    url:'/main',
    views:{
      'tab-main':{
          templateUrl:'main.html',
          controller:'AppCtrl'
      }
    }
  });

  $urlRouterProvider.otherwise('/tab/login');






})
