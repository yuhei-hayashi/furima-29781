FactoryBot.define do
  factory :item do
    name        { 'test_name' }
    explanation { 'test_explanation' }
    price       { rand(300..9_999_999) }
    area_id     { rand(1..47) }
    day_id      { rand(1..3) }
    status_id   { rand(1..6) }
    genre_id    { rand(1..10) }
    delivery_id { rand(1..2) }

    association :user
  end
end
