class AddEmployeeId < ActiveRecord::Migration
  def change
    add_column :employees, :work_id, :integer
  end
end
