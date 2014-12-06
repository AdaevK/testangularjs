require 'rails_helper'

RSpec.describe Api::PhotosController, type: :controller do

  context 'POST create' do
    before :each do
      post :create, format: :json, photo: photo
    end
    context 'with valid attributes' do

      let(:photo){ FactoryGirl.attributes_for(:photo)  }

      it{ expect{ post :create, format: :json, photo: photo }.to change( Photo, :count ).by(1) }
      it{ expect( response.status ).to eq 201 }
      it{ expect( response.content_type ).to eq Mime::JSON }
    end

    context 'with invalid attributes' do
      let(:photo){ FactoryGirl.attributes_for(:photo_invalid) }

      it{ expect{ post :create, format: :json, photo: photo }.to_not change( Photo, :count ) }
      it{ expect( response.status ).to eq 422 }
      it{ expect( response.content_type ).to eq Mime::JSON }
    end
  end

  context 'DELETE destroy' do
    let(:photo){ FactoryGirl.create(:photo) }

    it{ expect{ delete :destroy, format: :json, id: photo }.to change( Photo, :count ).by(0) }
    context 'status' do
      before :each do
        delete :destroy, format: :json, id: photo
      end

      it{ expect( response.status ).to eq 204 }
    end
  end
end
