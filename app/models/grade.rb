class Grade < ApplicationRecord
  before_create :update_pass_fields
  before_update :update_pass_fields
  belongs_to :student
  belongs_to :course
  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :student_id, uniqueness: { scope: :course_id }

  private

  def update_pass_fields
    self.rq1 = grade(q1)
    self.rq2 = grade(q2)
    self.rq3 = grade(q3)
    self.rq4 = grade(q4)
    self.rf = grade_final(q1, q2, q3, q4)
  end

  def grade(value)
    return 'pending' if value.nil?
    return 'failed' if !value.nil? && value < 6
    return 'passed' if !value.nil? && value > 5
  end

  def grade_final(quarter1, quarter2, quarter3, quarter4)
    return 'pending' if quarter1.nil? || quarter2.nil? || quarter3.nil? || quarter4.nil?

    media =  (quarter1 + quarter2 + quarter3 + quarter4) /4
    return 'failed' if media < 6
    
    'passed'
  end
end
