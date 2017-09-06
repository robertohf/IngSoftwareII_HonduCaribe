class RemoveFieldsIncapacities < ActiveRecord::Migration[5.0]
  def change
    rename_column :incapacities, :first_name, :name
    remove_column :incapacities, :last_name
  end
end
