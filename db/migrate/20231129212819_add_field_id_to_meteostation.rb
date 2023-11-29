class AddFieldIdToMeteostation < ActiveRecord::Migration[7.0]
  def change
    add_column :meteostations, :id_device, :integer
    add_index :meteostations, :id_device, unique: true
  end
end
