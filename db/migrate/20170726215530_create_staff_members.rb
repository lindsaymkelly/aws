class CreateStaffMembers < ActiveRecord::Migration[5.0]
  def up
    create_table :staff_members do |t|
      t.string :name, null: false
      t.text :bio, null: false
      t.attachment :image
      t.boolean :active?, null: false, default: true

      t.timestamps(null: false)
    end
  end

  def down
    drop_table :staff_members
  end
end
