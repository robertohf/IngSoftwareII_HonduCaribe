class Addability < ActiveRecord::Migration
  def change
    add_column :employees, :ability_id, :integer
    drop_table :fake_abilities
  end
end
