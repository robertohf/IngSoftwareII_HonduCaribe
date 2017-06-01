class Agregarcodigoadepartamento < ActiveRecord::Migration
  def change
    add_column :work_structures, :area_code, :string
  end
end
