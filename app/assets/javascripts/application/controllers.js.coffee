angular.module( 'TestApp.controllers', ['ngResource'] )
  .controller 'AdvertsController', [ '$scope', 'Advert', ($scope, Advert) ->
    $scope.adverts = Advert.index()
    $scope.showForm = false

    $scope.itemsPerPage = 10
    $scope.currentPage = 1

    $scope.setPage = (page) ->
      $scope.currentPage = page

    $scope.pageCount = ->
      Math.ceil( $scope.adverts.length / $scope.itemPerPage )

    $scope.adverts.$promise.then ->
      $scope.totalItems = $scope.adverts.length
      $scope.$watch 'currentPage + itemsPerPage', ->
        begin = (($scope.currentPage - 1) * $scope.itemsPerPage)
        end = begin + $scope.itemsPerPage

        $scope.filteredAdverts = $scope.adverts.slice(begin, end)
  ]

  .controller 'AdvertsFormController', [ 'Advert', (Advert) ->
    this.advert = {}
    this.uploader

    this.addAdvert = (form) ->
      if this.uploader.queue.length > 0
        this.advert.photo_ids = this.uploader.queue.map (element) ->
          element.id
      Advert.create({advert: this.advert})
      this.advert = {}
      this.uploader.clearQueue()
      form.$setPristine()
      form.$setUntouched()
  ]

  .controller 'AdvertShowController', [ '$stateParams', 'Advert', ($stateParams, Advert) ->
    store = this

    Advert.show {id: $stateParams.id}, (data) ->
      store.advert = data.advert
  ]

