FactoryGirl.define do
  factory :advert do
    sequence(:description) { Faker::Lorem.paragraph(10) }

    factory :advert_with_photo do
      after(:create) do |advert|
        create(:photo, advert: advert)
      end
    end

    factory :advert_invalid do
      description nil
    end
  end
end
