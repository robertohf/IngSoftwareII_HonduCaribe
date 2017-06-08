class Training < ActiveRecord::Base
  has_many :training_employees
  has_many :employees, through: :training_employees
  has_many :training_abilities
  has_many :abilities, through: :training_abilities


  belongs_to :institution

  def self.categories
    %w[Capacitacion Charla Seminario Taller]
  end

  def self.AddAbility(trainingId)

    @training = Training.find(trainingId)

    @training.employees.each do |e|
      @training.abilities.each do |a|
        if !e.abilities.include?(a)
          Employee.AddAbility(e.id, a.id, @training.id)
        end
      end
    end


  end


end
