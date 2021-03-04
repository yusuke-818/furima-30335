FactoryBot.define do
  factory :furima do
    item             { '株式投資の本' }
    info             { 'お金持ちになれます' }
    category_id      { 2 }
    states_id        { 2 }
    shipping_id      { 2 }
    prefecture_id    { 2 }
    shipping_days_id { 2 }
    price            { 500 }
    
    association :user

    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
