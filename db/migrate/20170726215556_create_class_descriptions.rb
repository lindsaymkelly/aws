class CreateClassDescriptions < ActiveRecord::Migration[5.0]
  def up
    create_table :class_descriptions do |t|
      t.string :classification, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :fees, null: false

      t.timestamps(null: false)
    end
  end

  def down
    drop_table :class_descriptions
  end
end
