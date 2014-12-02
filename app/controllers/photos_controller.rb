class PhotosController < ApplicationController
  def create
    photo = Photo.new( photo_params )

    respond_to do |format|
      if photo.save
        format.json { render json: photo, status: :created }
      else
        format.json { render json: photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    photo = Photo.find( params[:id] )
    photo.destroy
    head 204
  end

  private

    def photo_params
      params.require(:photo).permit(:image)
    end
end
