angular.module( 'TestApp.controllers', ['ngResource'] )
  .controller 'AdvertsController', [ 'Advert', (Advert) ->
    this.adverts = Advert.index()
    this.showForm = false
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

