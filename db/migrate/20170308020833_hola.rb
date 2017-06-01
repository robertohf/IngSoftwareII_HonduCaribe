class Hola < ActiveRecord::Migration
  def change
    drop_table :habilities
    add_column :work_structures, :field_code, :string

    create_table :abilities do |t|
      t.string :ability
    end

    create_table :employee_abilities do |t|
    end

    create_table :position_abilities do |t|
    end

    add_reference :employee_abilities, :employee, index: true, foreign_key: true
    add_reference :employee_abilities, :ability, index: true, foreign_key: true

    add_reference :position_abilities, :position, index: true, foreign_key: true
    add_reference :position_abilities, :ability, index: true, foreign_key: true
  end
end
