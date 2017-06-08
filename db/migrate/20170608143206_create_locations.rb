class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
