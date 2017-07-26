class CreateNewsUpdates < ActiveRecord::Migration[5.0]
  def up
    create_table :news_updates do |t|
    end
  end

  def down
    drop_table :news_updates
  end
end
