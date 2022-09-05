class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table(:users, id: :string) do |t|
      t.string :password
      t.string :token

      t.timestamps
    end
  end
end
