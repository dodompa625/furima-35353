class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ファッション' },
    { id: 2, name: 'インテリア' },
    { id: 3, name: '趣味' },
    { id: 4, name: '美容' },
    { id: 5, name: '家電' },
    { id: 6, name: 'チケット' },
    { id: 7, name: '自動車' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :products

  end

