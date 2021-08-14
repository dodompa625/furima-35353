# RSpec.configure do |config|
#   config.include FactoryBot::Syntax::Methods
# end


FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"田中"}
    first_name_kana {"タナカ"}
    last_name {"雅子"}
    last_name_kana {"マサコ"}
    birthday {Faker::Date.birthday}
  end
end
