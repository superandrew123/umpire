class AddDefaultsToInningAndNames < ActiveRecord::Migration
  def change
    change_column_default :games, :home_name, "Home"
    change_column_default :games, :away_name, "Away"
    change_column_default :games, :inning, 1
  end
end
