class CreateDependants < ActiveRecord::Migration
  def change
    create_table :dependants do |t|
      t.string :name
      t.string :relation

      t.timestamps null: false
    end
  end
end
