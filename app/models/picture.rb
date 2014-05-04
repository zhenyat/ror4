class Picture < ActiveRecord::Base
  validates :filename, presence: true, uniqueness: true
  validates :title,    presence: true
end
