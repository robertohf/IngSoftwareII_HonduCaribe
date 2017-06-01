class Soydundo < ActiveRecord::Migration
  def change
    add_column :trainings, :institution_id, :integer
    remove_column :trainings, :instituion_id
  end
end
