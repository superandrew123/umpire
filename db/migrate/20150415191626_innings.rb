class Innings < ActiveRecord::Migration
  def change
    create_table :innings do |t|
      t.integer :game_id
      t.integer :home_score
      t.integer :away_score
    end
  end
end
