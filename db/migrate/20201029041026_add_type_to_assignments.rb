class AddTypeToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :age, :string
  end
end
