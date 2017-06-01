class CreateFakeAbilities < ActiveRecord::Migration
  def change
    create_table :fake_abilities do |t|
      t.string :training_name
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
