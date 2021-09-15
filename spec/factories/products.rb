FactoryBot.define do
  factory :product do
    product_name {"サンプル商品名"}
    text {"サンプル商品説明"}
    category_id {1}
    status_id {1}
    delivery_fee_id {2}
    prefecture_id {14}
    delivery_date_id {2}
    price {500}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
