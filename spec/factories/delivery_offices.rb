FactoryBot.define do
  factory :delivery_office do
    trait :office_1 do
      name "office 1"
      postcode "OX49 5NU"
    end
    trait :office_2 do
      name "office 2"
      postcode "M32 0JG"
    end
    trait :office_3 do
      name "office 3"
      postcode "NE30 1DP"
    end
  end
end