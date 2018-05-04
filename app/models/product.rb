class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
end
