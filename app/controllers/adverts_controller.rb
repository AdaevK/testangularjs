class AdvertsController < ApplicationController
  def index
    @adverts = Advert.all

    respond_to do |format|
      format.html
      format.json { render json: @adverts, status: 200 }
    end
  end

  def create
    advert = Advert.new( advert_params )

    respond_to do |format|
      if advert.save
        format.json { render json: advert, status: :created, location: advert }
      else
        format.json { render json: advert.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @advert = Advert.find(params[:id])

    respond_to do |format|
      format.json { render json: @advert, status: 200, location: @advert }
    end
  end

  private

    def advert_params
      params.require(:advert).permit( :description, :photos )
    end
end
