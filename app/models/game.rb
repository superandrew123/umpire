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
end
