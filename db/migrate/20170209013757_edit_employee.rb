class EditEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :position
  end
end
