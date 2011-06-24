class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.id :user_id
      t.id :event_id

      t.timestamps
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :event_id
  end

  def self.down
    drop_table :subscriptions
  end
end
