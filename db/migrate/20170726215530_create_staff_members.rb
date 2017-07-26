class CreateStaffMembers < ActiveRecord::Migration[5.0]
  def up
    create_table :staff_members do |t|
    end
  end

  def down
    drop_table :staff_members
  end
end
