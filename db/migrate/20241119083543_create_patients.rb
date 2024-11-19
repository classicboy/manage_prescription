class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.datetime :dob, null: false
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
    add_index :patients, :name
  end
end
