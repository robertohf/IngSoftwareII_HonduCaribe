class Horas < ActiveRecord::Migration
  def change
    create_table :horas do |t|
      t.integer :employee_id
      t.datetime :fecha
      t.time :hora_entrada
      t.time :hora_salida
    end
  end
end
