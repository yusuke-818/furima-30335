class States < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品・未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷や汚れなし' },
    { id: 5, name: 'ややゴミ' },
    { id: 6, name: 'ほぼゴミ' },
    { id: 7, name: 'ゴミ' }
  ]

  include ActiveHash::Associations
  has_many :furimas
end
