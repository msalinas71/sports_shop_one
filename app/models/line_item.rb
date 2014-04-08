class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 0
  validates :product_id, :quantity, :price, presence: true
  
  after_create :decrement_stock
  after_create :set_price


  private
    def set_price
      self.price = product.price
    end
    
    def decrement_stock
      product.decrement_stock(quantity)
    end
    
end
