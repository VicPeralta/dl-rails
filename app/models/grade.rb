class Grade < ApplicationRecord
  belongs_to :student, :material
end
