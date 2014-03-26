class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, through: :line_items
  accepts_nested_attributes_for :line_items, :allow_destroy => true, :reject_if => lambda { |a| a[:product_id].blank? or a[:quantity].blank? or a[:price].blank? }
end
