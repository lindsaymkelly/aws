class CreateResults < ActiveRecord::Migration[5.0]
  def up
    create_table :results do |t|
      t.date :year, null: false
      t.string :level, null: false
      t.text :description, null: false
      t.attachment :image

      t.timestamps(null: false)
    end
  end

  def down
    drop_table :results
  end
end
