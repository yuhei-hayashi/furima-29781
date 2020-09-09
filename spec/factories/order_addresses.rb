FactoryBot.define do
  factory :order_address do
    post_code   {"442-0025"}
    area_id     {rand(1..47)}
    city        {"city"}
    house_number{"house_number"}
    building    {"tower"}
    telephone   {"08011711729"}
    token       {"token"}
  end
end
