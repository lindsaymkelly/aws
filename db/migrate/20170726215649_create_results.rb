class CreateResults < ActiveRecord::Migration[5.0]
  def up
    create_table :results do |t|
    end
  end

  def down
    drop_table :results
  end
end
