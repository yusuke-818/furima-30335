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
  validates :category_id, numericality: { other_than: 1 }
  validates :states_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_days_id, numericality: { other_than: 1 }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
