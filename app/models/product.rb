class Product < ApplicationRecord
  belongs_to :user
  # has_one: purchase
  has_one_attached :product_image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :product_image
    validates :product_name, length: {minimum:1, maximum:40}
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}, format:{with: /\A[0-9]+\z/}
    validates :text, length: {maximum:1000}
  end

  with_options presence: true, numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_date_id
  end
end