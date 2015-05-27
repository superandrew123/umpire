class Game < ActiveRecord::Base
  belongs_to :user
  has_many :innings

  def display_inning
    if self.inning % 2 == 0
      "Bot #{self.inning / 2}"
    else
      "Top #{(self.inning + 1)/ 2}"
    end
  end

  def read_inning(inning_string)
    inning = inning_string.split(" ")
    if inning[0] == "Top"
      self.inning = (inning[1].to_i * 2 - 1)
    else
      self.inning = (inning[1].to_i * 2)
    end
  end

  def my_game?(user)
    user.id == self.user_id if user != nil
  end

  def display_outs
    if self.outs < 2
      "#{self.outs} out"
    else
      "#{self.outs} outs"
    end
  end
end
