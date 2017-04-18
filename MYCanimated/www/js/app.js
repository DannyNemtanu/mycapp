angular.module("myc_menu", ["ionic","ionMdInput","ionic-material","ionic.rating","ionicLazyLoad","myc_menu.controllers", "myc_menu.services"])
	.run(function($ionicPlatform) {
		$ionicPlatform.ready(function() {
			if(window.cordova && window.cordova.plugins.Keyboard) {
				cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
				cordova.plugins.Keyboard.disableScroll(true);
			}

			if(window.StatusBar) {
				StatusBar.styleDefault();
			}

			setTimeout(function() {
			}, 100);

		});
	})


	.filter("to_trusted", ["$sce", function($sce){
		return function(text) {
			return $sce.trustAsHtml(text);
		};
	}])
	.filter("trustUrl", function($sce) {
		return function(url) {
			return $sce.trustAsResourceUrl(url);
		};
	})




.config(function($stateProvider, $urlRouterProvider,$sceDelegateProvider) {
	// Domain Whitelist
	$sceDelegateProvider.resourceUrlWhitelist([
		"self",
		new RegExp('^(http[s]?):\/\/(w{3}.)?youtube\.com/.+$'),
		new RegExp('^(http[s]?):\/\/(w{3}.)?w3schools\.com/.+$'),
	]);
	$stateProvider
	.state("myc_menu",{
		url: "/myc_menu",
			abstract: true,
			templateUrl: "templates/myc_menu-side_menus.html",
			controller: "side_menusCtrl",
	})

	.state("myc_menu.anime", {
		url: "/anime",
		views: {
			"myc_menu-side_menus" : {
						templateUrl:"templates/myc_menu-anime.html",
						controller: "animeCtrl"
					},
			"fabButtonUp" : {
						template: '',
					},
		}
	})

	.state("myc_menu.grades", {
		url: "/grades",
		views: {
			"myc_menu-side_menus" : {
						templateUrl:"templates/myc_menu-grades.html",
						controller: "gradesCtrl"
					},
			"fabButtonUp" : {
						template: '',
					},
		}
	})

	.state("myc_menu.library", {
		url: "/library",
		views: {
			"myc_menu-side_menus" : {
						templateUrl:"templates/myc_menu-library.html",
						controller: "libraryCtrl"
					},
			"fabButtonUp" : {
						template: '',
					},
		}
	})

	.state("myc_menu.login", {
		url: "/login",
		views: {
			"myc_menu-side_menus" : {
						templateUrl:"templates/myc_menu-login.html",
						controller: "loginCtrl"
					},
			"fabButtonUp" : {
						template: '',
					},
		}
	})

	.state("myc_menu.main", {
		url: "/main",
		views: {
			"myc_menu-side_menus" : {
						templateUrl:"templates/myc_menu-main.html",
						controller: "mainCtrl"
					},
			"fabButtonUp" : {
						template: '',
					},
		}
	})

	.state("myc_menu.news", {
		url: "/news",
		views: {
			"myc_menu-side_menus" : {
						templateUrl:"templates/myc_menu-news.html",
						controller: "newsCtrl"
					},
			"fabButtonUp" : {
						template: '',
					},
		}
	})

	.state("myc_menu.support", {
		url: "/support",
		views: {
			"myc_menu-side_menus" : {
						templateUrl:"templates/myc_menu-support.html",
						controller: "supportCtrl"
					},
			"fabButtonUp" : {
						template: '',
					},
		}
	})

	$urlRouterProvider.otherwise("/myc_menu/anime");
});
