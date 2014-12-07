angular.module( 'TestApp.directives', [] )
  .directive 'advertForm', (FileUploader)->
    {
      restrict: 'E',
      templateUrl: 'new.html',
      controller: 'AdvertsFormController',
      controllerAs: 'advertFormCtrl',
      link: (scope, element, attrs) ->
        scope.uploader = new FileUploader({
          url: '/api/photos',
          alias: 'image',
          method: 'POST',
          autoUpload: true,
          headers:{
            'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
          }
        })
        scope.advertFormCtrl.uploader = scope.uploader
        scope.uploader.filters.push
          name: "imageFilter"
          fn: (item, options) -> #{File|FileLikeObject}
            type = "|" + item.type.slice(item.type.lastIndexOf("/") + 1) + "|"
            "|jpg|png|jpeg|".indexOf(type) isnt -1
        scope.uploader.onSuccessItem = (item, response, status, headers) ->
          item.id = response.id.toString()
    }

  .directive "ngThumb", [
    "$window", ($window) ->
      helper =
        support: !!($window.FileReader and $window.CanvasRenderingContext2D)
        isFile: (item) ->
          angular.isObject(item) and item instanceof $window.File

        isImage: (file) ->
          type = "|" + file.type.slice(file.type.lastIndexOf("/") + 1) + "|"
          "|jpg|png|jpeg|bmp|gif|".indexOf(type) isnt -1

      return (
        restrict: "A"
        template: "<canvas/>"
        link: (scope, element, attributes) ->
          onLoadFile = (event) ->
            img = new Image()
            img.onload = onLoadImage
            img.src = event.target.result
            return
          onLoadImage = ->
            width = params.width or @width / @height * params.height
            height = params.height or @height / @width * params.width
            canvas.attr
              width: width
              height: height

            canvas[0].getContext("2d").drawImage this, 0, 0, width, height
            return
          return  unless helper.support
          params = scope.$eval(attributes.ngThumb)
          return  unless helper.isFile(params.file)
          return  unless helper.isImage(params.file)
          canvas = element.find("canvas")
          reader = new FileReader()
          reader.onload = onLoadFile
          reader.readAsDataURL params.file
          return
      )
  ]
