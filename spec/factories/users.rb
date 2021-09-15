FactoryBot.define do
  factory :user do
    nickname {"abe"}
    email {Faker::Internet.free_email}
    password {"aiueo123"}
    password_confirmation {"aiueo123"}
    first_name {"田中"}
    first_name_kana {"タナカ"}
    last_name {"雅子"}
    last_name_kana {"マサコ"}
    birthday {"2020-01-01"}
  end
end


