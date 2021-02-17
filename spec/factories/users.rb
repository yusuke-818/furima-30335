FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_reading    { 'ヤマダ' }
    last_name_reading     { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
