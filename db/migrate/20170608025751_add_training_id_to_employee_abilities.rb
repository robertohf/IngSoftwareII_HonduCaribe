class AddTrainingIdToEmployeeAbilities < ActiveRecord::Migration
  def change
    add_column :employee_abilities, :training_id, :integer
  end
end
