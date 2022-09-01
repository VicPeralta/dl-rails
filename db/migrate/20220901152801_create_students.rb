class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table(:students, id: :string) do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
