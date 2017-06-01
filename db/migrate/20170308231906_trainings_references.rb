class TrainingsReferences < ActiveRecord::Migration
  def change
    create_table :position_trainings do |t|
    end

    create_table :employee_trainings do |t|
    end

    add_reference :position_trainings, :position, index: true, foreign_key: true
    add_reference :position_trainings, :training, index: true, foreign_key: true

    add_reference :employee_trainings, :employee, index: true, foreign_key: true
    add_reference :employee_trainings, :training, index: true, foreign_key: true
end
end
