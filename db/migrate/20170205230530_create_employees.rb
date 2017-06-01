class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.text :profession
      t.date :birth_at
      t.text :birth_place
      t.date :date_admission
      t.string :position
      t.decimal :salary
      t.integer :number_id
      t.string :base_belong
      t.string :civil_status
      t.text :address
      t.string :blood_type
      t.string :emergency_contact_name
      t.integer :emergency_contact_number

      t.timestamps null: false
    end
  end
end
