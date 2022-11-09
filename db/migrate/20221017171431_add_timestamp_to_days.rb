class AddTimestampToDays < ActiveRecord::Migration[7.0]
  def change
    add_column :days, :tstamp, :timestamp
  end
end
