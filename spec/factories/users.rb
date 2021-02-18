FactoryBot.define do
  factory :user do
    nickname              { 'test太郎' }
    email                 { Faker::Internet.free_email }
    password              { 'taro123' }
    password_confirmation { password }
    last_name_em          { '山田' }
    first_name_em         { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
