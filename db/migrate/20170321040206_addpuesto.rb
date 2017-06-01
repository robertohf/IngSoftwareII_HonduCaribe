class Addpuesto < ActiveRecord::Migration
  def change
    add_column :abilities, :employee_id, :integer
    remove_column :employees, :ability_id
    add_column :employees, :work_structure_id, :integer
  end
end
