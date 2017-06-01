class Add < ActiveRecord::Migration
  def change
    add_column :employees, :ability_id, :integer
  end
end
