class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :receiver_telephone, :user_id, :product_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :receiver_telephone, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :product_id
    validates :token
  end
    validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }

    def save
      order = Order.create(user_id: user_id, product_id: product_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, receiver_telephone: receiver_telephone, order_id: order.id)
    end
end