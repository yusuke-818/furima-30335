class Order < ApplicationRecord
  belongs_to :furima
  belongs_to :user
  has_one :address
end
