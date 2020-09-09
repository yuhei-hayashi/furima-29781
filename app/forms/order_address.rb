class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :house_number, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    TELEPHONE_REGEX = /\A\d{11}\z/.freeze
    validates :telephone, format: { with: TELEPHONE_REGEX }
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, house_number: house_number, building: building, telephone: telephone, order_id: order.id)
  end
end
