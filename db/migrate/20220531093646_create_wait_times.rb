class CreateWaitTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :wait_times do |t|
      t.string :minutes
      t.string :set
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
