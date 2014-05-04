class Category < ActiveRecord::Base
  belongs_to :section
  has_many   :products, dependent: :destroy
  
  validates  :name,     presence: true, uniqueness: true, length: {maximum: 15}
end
