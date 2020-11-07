class Assignment < ApplicationRecord
  scope :not_in_family, ->(family) { where("family_id != ?", family.id) }
  scope :unassigned, -> { where("active IS FALSE") }
  scope :only_children, -> { where("age = ?", "child") }
  scope :only_adults, -> { where("age = ?", "adult") }

  belongs_to :family

  def activate
    self.update(active: true)
  end


  def self.find_assignments(family)
    assignments = []
    families_left = Family.incomplete.where.not(id: family.id)
    if families_left.length == 1
      assignments << self.where(family_id: families_left.first.id).unassigned
      assignments.flatten!
      assignments.each {|assignment| assignment.activate}
    end

    kids_needed = 2 - assignments.filter {|assignment| assignment.age == 'child'}.length
    adults_needed = 2 - assignments.filter {|assignment| assignment.age == 'adult'}.length


    assignments << not_in_family(family).unassigned.only_children.shuffle.take(kids_needed)
    assignments << not_in_family(family).unassigned.only_adults.shuffle.take(adults_needed)
    assignments.flatten!
      

    family.complete
    assignments.each {|assignment| assignment.activate}

    return assignments
  end
end
