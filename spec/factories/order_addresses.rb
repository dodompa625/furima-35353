FactoryBot.define do
  factory :order_address do
      postal_code { '123-4567' }
      prefecture_id { 1 }
      city { '東京都' }
      house_number { '1-1' }
      building_name { '東京ハイツ' }
      receiver_telephone { 12345678910 }
      product_id { 1 }
      user_id { 2 }
      token {"tok_abcdefghijk00000000000000000"}
  end
end
