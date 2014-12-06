require 'rails_helper'

RSpec.describe Api::AdvertsController, :type => :controller do

  context "GET index" do

    let(:advert){ FactoryGirl.create(:advert) }

    before :each do
      get :index, format: :json
    end

    it{ expect(response).to have_http_status :success }
    it{ expect(response.content_type).to eq Mime::JSON }
  end

  context 'POST create' do
    before :each do
      post :create, format: :json, advert: advert
    end

    context 'with valid attributes' do
      let(:advert){ FactoryGirl.attributes_for(:advert) }

      it{ expect{ post :create, format: :json, advert: advert }.to change( Advert, :count ).by(1) }
      it{ expect(response).to have_http_status :created }
      it{ expect(response.content_type).to eq Mime::JSON }
    end

    context 'with invalid attributes' do
      let(:advert){ FactoryGirl.attributes_for(:advert_invalid) }

      it{ expect{ post :create, format: :json, advert: advert }.to_not change( Advert, :count ) }
      it{ expect(response).to have_http_status :unprocessable_entity }
      it{ expect(response.content_type).to eq Mime::JSON }
    end
  end

  context 'GET show' do
    before :each do
      get :show, format: :json, id: advert
    end
    let(:advert){ FactoryGirl.create(:advert) }

    it{ expect(response).to have_http_status :success }
    it{ expect(response.content_type).to eq Mime::JSON }
    it{ expect(assigns(:advert)).to eq advert }
  end
end
