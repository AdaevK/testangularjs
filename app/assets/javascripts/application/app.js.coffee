app = angular.module( 'TestApp', ['ngResource', 'ui.router', 'templates'] )
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

    $stateProvider.state(home)
    $stateProvider.state(about)
    $urlRouterProvider.otherwise('/')
    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false
    })
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

app.factory 'Advert', [ '$resource', ($resource) ->
  $resource '/adverts/:id', { id: '@id' },
    {
      'create':  { method: 'POST' },
      'index':   { method: 'GET', isArray: true },
      'show':    { method: 'GET', isArray: false },
      'update':  { method: 'PUT' },
      'destroy': { method: 'DELETE' }
    }
]

app.controller 'AdvertsController', [ '$scope', 'Advert', ($scope, Advert) ->
  this.adverts = Advert.index()
  this.showForm = false
]
  .directive 'advertForm', ->
    {
      restrict: 'E',
      templateUrl: 'new.html',
      controller: ->
        this.advert = {}
      controllerAs: 'advertFormCtrl',
    }
