class AgregarReferencias < ActiveRecord::Migration
  def change
    drop_table :training_institutions
    add_reference :instructors, :institution, index: true, foreign_key: true
  end
end
