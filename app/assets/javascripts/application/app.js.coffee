app = angular.module( 'TestApp', [
                     'ngResource',
                     'ui.router',
                     'templates',
                     'angularFileUpload',
                     'TestApp.resources',
                     'TestApp.controllers',
                     'TestApp.directives',
                     'ui.bootstrap.pagination'
] )
  .config [ '$stateProvider', '$urlRouterProvider', '$locationProvider', '$httpProvider', ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
    home = {
      name: 'home',
      url: '/',
      templateUrl: 'index.html'
    }
    about = {
      name: 'about',
      url: '/about',
      templateUrl: 'about.html'
    }
    show = {
      name: 'adverts',
      url: '/adverts/{id:int}',
      templateUrl: 'show.html'
      controller: 'AdvertShowController',
      controllerAs: 'advertShowCtrl'
    }

    $stateProvider.state(home)
    $stateProvider.state(about)
    $stateProvider.state(show)
    $urlRouterProvider.otherwise('/')
    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false
    })
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

