require 'rails_helper'

RSpec.describe Photo, :type => :model do
  let(:photo){ FactoryGirl.build(:photo) }
  it{ should belong_to(:advert) }

  it{ should have_attached_file(:image) }
  it{ should validate_attachment_presence(:image) }
  it{ should validate_attachment_content_type(:image).allowing( 'image/png', 'image/jpeg', 'image/jpg' ) }
  it{ should validate_attachment_size(:image).less_than(2.megabytes) }
  it{ expect( photo ).to be_valid }
end
