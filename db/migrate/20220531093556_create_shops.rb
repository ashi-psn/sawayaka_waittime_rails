class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.float :lat
      t.float :lng

      t.timestamps
    end
    add_index :shops, :name, unique: true
  end
end
