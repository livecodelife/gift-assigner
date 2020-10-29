class Family < ApplicationRecord
  has_many :assignments


  def complete
    self.update(completed: true)
  end
end
