class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password, null: false

      t.timestamps
    end
    add_index :doctors, :email, unique: true
  end
end
