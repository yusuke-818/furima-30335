class ShippingDays < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1〜２日で発送' },
    { id: 3, name: '３〜４日で発送' },
    { id: 4, name: 'そのうち発送' }
  ]

  include ActiveHash::Associations
  has_many :furimas
end
