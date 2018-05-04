require 'rails_helper'

describe Product do
  it { should have_many :order_items }
end
