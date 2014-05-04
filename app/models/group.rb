class Group < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
