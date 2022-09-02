class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :student_id, uniqueness: {scope: :course_id}
end
