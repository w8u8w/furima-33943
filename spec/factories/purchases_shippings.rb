FactoryBot.define do
  factory :purchases_shipping do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '札幌市' }
    block_number { '札幌' }
    building_name { 'あいうビル' }
    phone_number { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
