class Ability < ActiveRecord::Base
  has_many :employee_abilities
  has_many :training_abilities

  has_many :employees, through: :employee_abilities
  has_many :trainings, through: :trainings_abilities


  has_many :work_structure_abilities
  has_many :work_structures, through: :work_structure_abilities
end
