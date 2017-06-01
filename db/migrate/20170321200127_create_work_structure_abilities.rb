class CreateWorkStructureAbilities < ActiveRecord::Migration
  def change
    create_table :work_structure_abilities do |t|
      t.integer :ability_id
      t.integer :work_structure_id

      t.timestamps null: false
    end
  end
end
