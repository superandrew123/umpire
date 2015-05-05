class DefaultScores < ActiveRecord::Migration
  def change
    change_column_default :games, :home_score, 0
    change_column_default :games, :away_score, 0
  end
end
