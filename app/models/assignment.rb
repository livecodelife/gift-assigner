class Assignment < ApplicationRecord
  scope :not_in_family, ->(family) { where("family_id != ?", family.id) }
  scope :unassigned, -> { where("active IS FALSE") }
  scope :only_children, -> { where("age = ?", "child") }
  scope :only_adults, -> { where("age = ?", "adult") }

  belongs_to :family

  def activate
    self.update(active: true)
  end
end
