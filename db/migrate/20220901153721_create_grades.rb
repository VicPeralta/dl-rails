class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.integer :q1
      t.integer :q2
      t.integer :q3
      t.integer :q4
      t.string :rq1
      t.string :rq2
      t.string :rq3
      t.string :rq4
      t.string :rf

      t.timestamps
    end
    add_reference(:grades, :student, foreign_key: true, type: :string)
    add_reference(:grades, :course, foreign_key: true, type: :string)
    add_index(:grades, [:student_id, :course_id], unique:true)
  end
end
