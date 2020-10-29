class AddForeignKeyToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_reference :assignments, :family, foreign_key: true
  end
end
