class Games < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_score
      t.integer :away_score
      t.string :home_name
      t.string :away_name
      t.integer :user_id
    end
  end
end
