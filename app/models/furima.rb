class Furima < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image
end
