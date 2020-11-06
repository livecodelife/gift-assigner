class Family < ApplicationRecord
  scope :incomplete, -> {where("completed IS FALSE")} 
  has_many :assignments


  def complete
    self.update(completed: true)
  end
end
