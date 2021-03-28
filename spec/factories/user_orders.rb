FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '札幌' }
    addresses { '123' }
    building { '札幌マンション' }
    phone_number { 09012345678 }
  end
end
