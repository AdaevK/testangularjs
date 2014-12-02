include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :photo do
    image { fixture_file_upload( Rails.root.join('spec', 'fixtures', 'test_img.jpg'), 'image/jpg' ) }

    factory :photo_with_advert do
      association :advert
    end
    factory :photo_invalid do
      image nil
    end
  end

end
