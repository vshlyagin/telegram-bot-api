class CreateMeteostations < ActiveRecord::Migration[7.0]
  def change
    create_table :meteostations do |t|
      t.string :temp
      t.string :wet
      t.string :co
      t.timestamps
    end
  end
end
