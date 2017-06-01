class WorkStructure < ActiveRecord::Base
  has_many :employees
  has_many :work_structure_abilities
  has_many :abilities, through: :work_structure_abilities
end
