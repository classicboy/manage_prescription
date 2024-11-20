class RemovePasswordFromDoctors < ActiveRecord::Migration[7.1]
  def change
    remove_column :doctors, :password, :string
  end
end
