module Api
  class PhotosController < ApplicationController
    respond_to :json

    def create
      photo = Photo.new( photo_params )

      if photo.save
        render json: photo, only: :id, status: :created
      else
        render json: photo.errors, status: :unprocessable_entity
      end
    end

    def destroy
      photo = Photo.find( params[:id] )
      photo.destroy
      head :no_content
    end

    private

      def photo_params
        if params[:photo]
          params.require(:photo).permit(:image)
        else
          { image: params[:image] }
        end
      end
  end
end
