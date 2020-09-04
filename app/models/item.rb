class Item < ApplicationRecord
  belongs_to :user
  has_many :order

  validates :user , presence: true , foreign_key: true
end
