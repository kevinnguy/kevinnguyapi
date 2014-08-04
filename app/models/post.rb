class Post < ActiveRecord::Base
  before_save :kudos_multiplier
  validates :name, presence:

  def kudos_multiplier
    if self.kudos
      self.kudos *= 2
    else
      self.kudos = 5
    end
  end


end
