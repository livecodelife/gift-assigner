class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :person
      t.boolean :active, default: false
    end
  end
end
