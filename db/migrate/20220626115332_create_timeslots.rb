class CreateTimeslots < ActiveRecord::Migration[7.0]
  def change
    create_table :timeslots do |t|
      t.string :name
      t.references :day
      t.timestamps
      t.string :booker
    end
  end
end
