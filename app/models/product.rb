class Product < ActiveRecord::Base
  
  validates :name, :length => { :maximum => 255 }, :uniqueness => true
  has_many :line_items
  has_many :orders, through: :line_items
  
  validates :name, :registered_at, :stock, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates_numericality_of :stock, :only_integer => true, :greater_than_or_equal_to => 0
  
  CATEGORY_LIST = [ "books", "music & movies", "electronics", "home", "toys", "clothing", "foodstuff", "     " ]
  validates :product_category, inclusion: CATEGORY_LIST


  scope :by_registered_at,    ->(date) { where("registered_at = ?", date) }
  scope :by_manufacturer,     ->(manufacturer) { where("manufacturer = ?", manufacturer) }
  scope :by_stock,            ->(stock) { where("stock = ?", stock) }
  scope :by_product_category, ->(product_category) { where("product_category = ?", product_category) }
  scope :by_lowest_price,     ->(price) { where("price <= ?", price) }
  scope :by_highest_price,    ->(price) { where("price >= ?", price) }


    def decrement_stock(quantity)
		self.stock -= quantity
		update_column(:stock, self.stock)
  end

end