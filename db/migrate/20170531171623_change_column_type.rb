class ChangeColumnType < ActiveRecord::Migration
  def change
    rename_column :permissions, :type, :permission_type
  end
end
