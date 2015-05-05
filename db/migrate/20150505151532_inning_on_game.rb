class InningOnGame < ActiveRecord::Migration
  def change
    add_column :games, :inning, :integer
  end
end
