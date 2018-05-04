class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates :name, uniqueness: true
end
