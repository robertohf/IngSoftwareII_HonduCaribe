class CreateIncapacities < ActiveRecord::Migration[5.0]
  def change
    create_table :incapacities do |t|
      t.string :first_name
      t.string :last_name
      t.string :employee
      t.numeric :employee_id
      t.string :doctor
      t.string :insurance
      t.date :down_date
      t.text :condition

      t.timestamps
    end
  end
end
