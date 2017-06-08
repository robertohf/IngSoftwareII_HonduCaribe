class Hour < ActiveRecord::Base
  belongs_to :employee

  def self.tiposhorarios
    %w[Diurno Mixto Nocturno]
  end

end

