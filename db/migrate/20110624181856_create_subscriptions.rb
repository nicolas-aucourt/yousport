class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.id :user_id
      t.id :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
