class AddDateEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :startdate, :datetime
    add_column :events, :enddate, :datetime
  end

  def self.down
    remove_column :events, :startdate
    remove_column :events, :enddate
  end
end
