require 'rails_helper'

RSpec.describe Advert, :type => :model do
  let(:advert){ FactoryGirl.build(:advert) }
  it{ should have_db_column(:description).of_type(:text).with_options( null: false ) }

  it{ should have_many(:photos).dependent(:destroy) }

  it{ should validate_presence_of(:description) }
  it{ expect( advert ).to be_valid }
end
