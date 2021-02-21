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

end
