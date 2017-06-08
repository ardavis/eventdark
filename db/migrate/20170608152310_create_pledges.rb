class CreatePledges < ActiveRecord::Migration[5.1]
  def change
    create_table :pledges do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :guest_count, default: 0

      t.timestamps
    end
  end
end
