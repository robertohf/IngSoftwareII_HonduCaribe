class ReferencesTables < ActiveRecord::Migration
  def change
    add_reference :educations, :employee, index: true, foreign_key: true
    add_reference :work_exps, :employee, index: true, foreign_key: true
    add_reference :habilities, :employee, index: true, foreign_key: true
    add_reference :employees, :position, index: true, foreign_key: true
    add_reference :positions, :work_structure, index: true, foreign_key: true
  end
end
