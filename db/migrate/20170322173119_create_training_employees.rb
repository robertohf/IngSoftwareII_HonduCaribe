class CreateTrainingEmployees < ActiveRecord::Migration
  def change
    create_table :training_employees do |t|
      t.integer :employee_id
      t.integer :training_id

      t.timestamps null: false
    end
  end
end
