FactoryBot.define do
  factory :order do
    user { nil }
    listing { nil }
    payment_intent_id { "MyString" }
    receipt_url { "MyString" }
  end
end
