class CreateStandups < ActiveRecord::Migration[5.0]
  def change
    create_table :standups do |t|
      t.string :name
      t.integer :minute
      t.integer :hour
      t.text :days

      t.timestamps
    end
  end
end
