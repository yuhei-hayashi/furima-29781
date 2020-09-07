class Item < ApplicationRecord
  belongs_to :user
  has_many :order
  has_one_attached :image
end
