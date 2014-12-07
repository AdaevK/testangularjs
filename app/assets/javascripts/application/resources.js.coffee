angular.module('TestApp.resources', [])
  .factory 'Advert', [ '$resource', ($resource) ->
    $resource '/api/adverts/:id', { id: '@id' },
      {
        'create':  { method: 'POST' },
        'index':   { method: 'GET', isArray: true },
        'show':    { method: 'GET' },
        'update':  { method: 'PUT' },
        'destroy': { method: 'DELETE' }
      }
  ]
