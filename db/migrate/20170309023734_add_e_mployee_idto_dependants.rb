class AddEMployeeIdtoDependants < ActiveRecord::Migration
  def change
    add_column :dependants, :employee_id, :integer
  end
end
