class CodDepartment < ActiveRecord::Migration
  def change
    add_column :work_structures, :code_department, :string
  end
end
