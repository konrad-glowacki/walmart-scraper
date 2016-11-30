class Product < ActiveRecord::Base
  validates :item_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
end
