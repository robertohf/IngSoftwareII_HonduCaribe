class AddCoumnsEmployee < ActiveRecord::Migration
  def change
    add_column :permissions, :description, :text
    remove_column :employees, :scheduletype
    add_column :hours, :scheduletype, :string
    add_column :employees, :monthly_permissions, :integer
    add_column :employees, :annual_permissions, :integer
  end
end
