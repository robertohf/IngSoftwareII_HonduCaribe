class AddConfirmarAsistenciaToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :asistenciaConfirmada, :boolean

  end
end
