class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :started_at
      t.datetime :ended_at
      t.float :cost
      t.integer :location_id

      t.timestamps
    end
  end
end
