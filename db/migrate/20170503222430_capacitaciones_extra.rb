class CapacitacionesExtra < ActiveRecord::Migration
  def change
    add_column :trainings, :planned, :boolean
  end
end
