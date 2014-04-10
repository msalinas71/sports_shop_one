class Order < ActiveRecord::Base
  
  has_many :line_items
  has_many :products, through: :line_items

  accepts_nested_attributes_for :line_items, :allow_destroy => true, :reject_if => lambda { |a| a[:product_id].blank? or a[:quantity].blank? }
  
  validates :order_status, :payment_method, :shipping_address, :shipping_city, :customer_name, :customer_last_name, presence: true
  PAYMENT_TYPES = [ "Cash", "Credit card", "Paypal" ]
  validates :payment_method, inclusion: PAYMENT_TYPES
  STATUS = [ "Pending", "Sent", "Received" ]
  validates :order_status, inclusion: STATUS

  before_validation :set_status, only: [:create]

  	private 
 
    def set_status   
      self.order_status = "Pending"
    end  
end
