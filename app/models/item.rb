class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :day
  belongs_to_active_hash :area
  belongs_to :user
  has_many :order
  has_one_attached :image

  with_options presence: true do
    with_options numericality: { other_than: 0 } do 
    validates :genre_id
    validates :status_id
    validates :delivery_id
    validates :day_id
    validates :area_id
    end
    validates :user_id
    validates :image
    validates :price , inclusion: {in: 300..9999999}
  end
end
