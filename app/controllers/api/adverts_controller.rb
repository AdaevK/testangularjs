module Api
  class AdvertsController < ApplicationController
    respond_to :json

    def index
      @adverts = Advert.all

      render json: @adverts, serializer: AdvertsCollectionSerializer, status: 200
    end

    def create
      advert = Advert.new( advert_params )

      if advert.save
        render json: advert, status: :created, location: [:api, advert]
      else
        render json: advert.errors, status: :unprocessable_entity
      end
    end

    def show
      @advert = Advert.find(params[:id])

     render json: @advert, status: 200, location: [:api, @advert]
    end

    private

      def advert_params
        params.require(:advert).permit( :description, photo_ids: [] )
      end
  end
end
