class Section < ActiveRecord::Base
  has_many  :categories, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 10}
end
