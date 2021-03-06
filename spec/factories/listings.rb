FactoryBot.define do
  factory :listing do
    name { "MyString" }
    category { nil }
    material { nil }
    price { 1 }
    description { "MyText" }
  end
end
