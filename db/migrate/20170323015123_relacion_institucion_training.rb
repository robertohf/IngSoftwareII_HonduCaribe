class RelacionInstitucionTraining < ActiveRecord::Migration
  def change
    add_reference :institutions, :training, index: true, foreign_key: true
  end
end
