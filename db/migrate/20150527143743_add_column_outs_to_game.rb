class AddColumnOutsToGame < ActiveRecord::Migration
  def change
    add_column :games, :outs, :integer, default: 0
  end
end
