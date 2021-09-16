FactoryBot.define do
  # before do
  #   user = FactoryBot.create(:user)
  #   product = FactoryBot.create(:product)
  # end

  factory :order_address do
      postal_code { '123-4567' }
      prefecture_id { 1 }
      city { '東京都' }
      house_number { '1-1' }
      building_name { '東京ハイツ' }
      receiver_telephone { 12345678910 }
      token {"tok_abcdefghijk00000000000000000"}
      # user_id { user.id }
      # product_id { product.id }

  end
end
