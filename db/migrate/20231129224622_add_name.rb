class AddName < ActiveRecord::Migration[7.0]
  def change
    add_column :meteostations, :name, :string
  end
end
