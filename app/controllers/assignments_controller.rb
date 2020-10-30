class AssignmentsController < ApplicationController
  def index
    
  end

  def find_assignments
    assignment = Assignment.find_by(person: params[:name].capitalize)
    redirect_to :root, alert: "Could not find a family with a member by that name" and return if !assignment

    family = assignment.family

    if (!family.completed)
      @assignments = Assignment.not_in_family(family).unassigned.only_children.shuffle.take(2)
      @assignments << Assignment.not_in_family(family).unassigned.only_adults.shuffle.take(2)
      @assignments.flatten!

      family.complete
      @assignments.each {|assignment| assignment.activate}
    else
      redirect_to :root, alert: "Your family has already received it's assignments" and return
    end

    render :index
  end
end
