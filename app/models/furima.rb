class Furima < ApplicationRecord
  has_one :order
  belongs_to :user
end
