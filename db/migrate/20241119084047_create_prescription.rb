class CreatePrescription < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.text :detail, null: false
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
