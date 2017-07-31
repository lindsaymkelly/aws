class CreateScheduledClasses < ActiveRecord::Migration[5.0]
  def up
    create_table :scheduled_classes do |t|
      t.string :day, null: false
      t.time :time, null: false
      t.boolean :active, null: false, default: true
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
