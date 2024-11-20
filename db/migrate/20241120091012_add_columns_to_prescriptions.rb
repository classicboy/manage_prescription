class AddColumnsToPrescriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :prescriptions, :date, :datetime, null: false
    add_column :prescriptions, :remark, :text
  end
end
