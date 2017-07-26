class CreateScheduledClasses < ActiveRecord::Migration[5.0]
  def up
    create_table :scheduled_classes do |t|
    end
  end

  def down
    drop_table :scheduled_classes
  end
end
