class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :employee_id
      t.datetime :time_in
      t.datetime :time_out
      t.string :type
    end
  end
end
