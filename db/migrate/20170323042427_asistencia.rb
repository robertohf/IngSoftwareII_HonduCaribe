class Asistencia < ActiveRecord::Migration
  def change
    add_column :training_employees, :asistencia, :boolean
  end
end
