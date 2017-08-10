class CreateScheduledClasses < ActiveRecord::Migration[5.0]
  def up
    create_table :scheduled_classes do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.time :time, null: false
      t.string :name, null: false
      t.text :about, null: false
      t.string :instructor, null: false

      t.timestamps(null: false)
    end
  end

  def down
    drop_table :scheduled_classes
  end
end
