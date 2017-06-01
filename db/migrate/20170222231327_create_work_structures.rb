class CreateWorkStructures < ActiveRecord::Migration
  def change
    create_table :work_structures do |t|
      t.string :department
      t.string :area
      t.string :sub_area

      t.timestamps null: false
    end
  end
end
