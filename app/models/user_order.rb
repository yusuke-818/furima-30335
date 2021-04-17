class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :furima_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Include hyphen(-)' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, furima_id: furima_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                   phone_number: phone_number, order: order)
  end
end
