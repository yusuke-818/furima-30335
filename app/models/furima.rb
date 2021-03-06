class Furima < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :shipping
  belongs_to :states

  validates :image, :item, :info, :price, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :states_id
    validates :shipping_id
    validates :prefecture_id
    validates :shipping_days_id
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
