class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :training_name
      t.boolean :check_employee
      t.boolean :check_intern
      t.boolean :check_exterior
      t.integer :duration
      t.datetime :start_date
      t.datetime :end_date
      t.string :instructor

      t.timestamps null: false
    end
  end
end
