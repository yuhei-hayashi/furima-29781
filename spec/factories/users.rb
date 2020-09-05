FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {password}
    first_name            {"田中"}
    last_name             {"太郎"}
    first_name_reading    {"タナカ"}
    last_name_reading     {"タロウ"}
    birthday              {Faker::Date.birthday(min_age: 4, max_age: 150)}
  end
end
