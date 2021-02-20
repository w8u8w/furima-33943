FactoryBot.define do
  factory :item do
    name_of_item        { Faker::Lorem.sentence }
    item_description    { Faker::Lorem.sentence }
    item_category_id    { 2 }
    item_condition_id   { 3 }
    who_expense_id      { 2 }
    prefecture_id       { 3 }
    days_to_shipment_id { 2 }
    sales_price         { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image.png'), filename: 'image.png', content_type: 'image/png')
    end
  end
end
