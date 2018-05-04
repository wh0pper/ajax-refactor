class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true


  before_save :calculate_total

  def calculate_total
    self.total_price = order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def finalize(user)
    self.user_id = user.id
    self.status = 2
    self.save
  end

  def add_item(item)
    existing_product_ids = self.order_items.pluck(:product_id)
    if existing_product_ids.include?(item.product_id)
      existing_item = OrderItem.where(:product_id => item.product_id)[0]
      updated_quantity = item.quantity + existing_item.quantity
      existing_item.update(:quantity => updated_quantity)
    else
      self.order_items.push(item)
    end
  end

  def self.retrieve_or_create(user)
    incomplete_orders = user.orders.where(:status => 1)
    if incomplete_orders.empty?
      order = Order.create!
      session[:order_id] = order.id
      return order
    else
      session[:order_id] = incomplete_orders.first.id
      return incomplete_orders.first
    end
  end
end
