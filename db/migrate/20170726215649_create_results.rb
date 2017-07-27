class CreateResults < ActiveRecord::Migration[5.0]
  def up
    create_table :results do |t|
      t.date :year
      t.string :level
      t.text :description
      t.attachment :image

      t.timestamps(null: false)
    end
  end

  def down
    drop_table :results
  end
end
