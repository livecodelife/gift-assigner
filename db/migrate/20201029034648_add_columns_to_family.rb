class AddColumnsToFamily < ActiveRecord::Migration[6.0]
  def change
    add_column :families, :completed, :boolean, default: false
  end
end
