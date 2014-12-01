FactoryGirl.define do
  factory :advert do
    sequence(:description) { Facker::Lorem.paragraph(10) }
  end

end
