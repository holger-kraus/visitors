class CreateWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :weeks do |t|
      t.string :name
      t.integer :next
      t.integer :previous
      t.timestamp :firstday
      t.timestamp :lastday
      t.timestamps
    end
  end
end
