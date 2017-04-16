angular.module('starter.controllers',[])

.controller('AppCtrl',function($scope,$ionicModal,$timeout,$ionicPopup,$http,$state,$ionicHistory){

    
    
    var url="http://localhost/MYC/www/conect/";

    
    $scope.loginData={};

    $scope.doLogin=function(){
      var email=$scope.loginData.username;
      var pass=$scope.loginData.password;

      if(email && pass){
          str=url+"login.php?username="+email+"&password="+pass;
          $http.get(str)
            .success(function(response){

                $scope.admin=response.records;
                sessionStorage.setItem('loggedin_status',true);
                sessionStorage.setItem('loggedin_id',$scope.admin.studentNumber);
                sessionStorage.setItem('loggedin_status',$scope.admin.email);

                $ionicHistory.nextViewOptions({
                  disableAnimate:true,
                  disableBack:true
                })

                $ionicPopup.alert({
                  title:'Login',
                  template:'Welcome to MYC'
                })

                $state.go('tab.main',{},{location:"replace",reload:true});
            })
            .error(function(){

              $ionicPopup.alert({
                title:'Login',
                template:'Opps I cant login, Please check and try again'
              })
            });

      }else{
        $ionicPopup.alert({
          title:'Login',
          template:'Please fill in all information.'
        })

      }

    }









    $scope.doLogout=function(){

      sessionStorage.removeItem('loggedin_status');
      sessionStorage.removeItem('loggedin_id');
      sessionStorage.removeItem('loggedin_status');

      $ionicHistory.nextViewOptions({
        disableAnimate:true,
        disableBack:true
      })

      $ionicPopup.alert({
        title:'Login',
        template:'Thanks see soon'
      })

      $state.go('tab.login',{},{location:"replace",reload:true});


    }












})
