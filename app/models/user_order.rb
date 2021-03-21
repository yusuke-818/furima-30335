class UserOrder
  include ActiveModel::Model
  attr_accessor :user, :furima, :postal_code, :prefecture, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Include hyphen(-)" }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "Phone number Input only number" }
  end
  validates :prefecture, numericality: { other_than: 0, message: "Prefecture Select" }
  
  def save
    #furima.create()
    addresses.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number, user_id: user_id)
  end
end