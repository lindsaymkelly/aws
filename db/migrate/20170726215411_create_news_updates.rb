class CreateNewsUpdates < ActiveRecord::Migration[5.0]
  def up
    create_table :news_updates do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :date
      t.boolean :active, null: false, default: true
      t.attachment :image

      t.timestamps(null: false)
    end
  end

  def down
    drop_table :news_updates
  end
end
