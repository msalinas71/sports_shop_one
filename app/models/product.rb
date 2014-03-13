class Product < ActiveRecord::Base
  validates :name, :length => { :maximum => 255 }
  has_many :line_items
  has_many :orders, through: :line_items
end
