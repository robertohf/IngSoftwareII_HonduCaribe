class Loquefalta < ActiveRecord::Migration
  def change
    remove_column :trainings, :instructor
    add_column :trainings, :instructor_id, :integer
    add_column :trainings, :instituion_id, :integer
    remove_column :institutions, :training_id
  end
end
