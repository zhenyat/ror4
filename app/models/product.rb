class Product < ActiveRecord::Base

  belongs_to :categories

  validates :category_id, presence: true
  validates :name,        presence: true, length: {maximum: 20}
  validates :sku,         presence: true, length: {maximum:15}, uniqueness: true
  validates :price,       presence: true, numericality: {greater_than_or_equal_to: 0.00}
end
