class Product < ActiveRecord::Base
  validates :external_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :url, presence: true, uniqueness: true
end
