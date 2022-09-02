class Student < ApplicationRecord
  has_many :grades, dependent: :destroy
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
end
