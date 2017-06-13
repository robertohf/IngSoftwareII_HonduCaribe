class Training < ActiveRecord::Base
  has_many :training_employees
  has_many :employees, through: :training_employees
  has_many :training_abilities, dependent: :destroy
  has_many :abilities, through: :training_abilities
  validates_presence_of :training_name, :category

  belongs_to :institution

  def self.categories
    %w[Capacitacion Charla Seminario Taller]
  end

  def self.AddAbility(trainingId)

    @training = Training.find(trainingId)
    @training_employees = @training.training_employees.all

    @training_employees.each do |e|

      if e.asistencia
        @training.abilities.each do |a|

          if !Employee.find(e.employee_id).abilities.include?(a)
            Employee.AddAbility(e.employee_id, a.id, @training.id)
          end

        end
      end

    end


  end

  def removerHabilidadesDeEmpleados

    @training_employees = self.training_employees.all

    @training_employees.each do |e|

      Employee.RemoveTrainingAbilities(self.id, e.employee_id)

    end
  end

  def RemoverReferencias

    @training_employees = self.training_employees.all

    @training_employees.each do |e|

      Employee.RemoveTrainingReferences(self.id, e.employee_id)

    end
  end

end
