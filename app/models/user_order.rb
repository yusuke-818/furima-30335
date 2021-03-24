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

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width characters' } do
    validates :first_name_reading
    validates :last_name_reading
  end
  
  def save
    user = User.create(nickname: nickname, last_name: last_name, first_name: first_name)
    furima = Furima.create(item: item)
    addresses.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number, user_id: user.id, furima_id: furima.id)
  end
end