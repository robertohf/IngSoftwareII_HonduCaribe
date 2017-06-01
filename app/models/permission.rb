class Permission < ActiveRecord::Base
  belongs_to :employee

  def self.tipos
    ['Vacaciones', 'Medico', 'Sin Permiso', 'Personal']
  end
end
