class CreateClassDescriptions < ActiveRecord::Migration[5.0]
  def up
    create_table :class_descriptions do |t|
    end
  end

  def down
    drop_table :class_descriptions
  end
end
