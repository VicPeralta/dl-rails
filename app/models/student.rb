class Student < ApplicationRecord
  has_many :grades
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
end
