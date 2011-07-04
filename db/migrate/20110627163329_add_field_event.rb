class AddFieldEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :address, :string
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
    add_column :events, :gmaps, :boolean
  end

  def self.down
    remove_column :events, :address
    remove_column :events, :longitude
    remove_column :events, :latitude
    remove_column :events, :gmaps
  end
end
