class WorkStructure < ActiveRecord::Base
  has_many :employees
  has_many :work_structure_abilities, dependent: :destroy
  has_many :abilities, through: :work_structure_abilities
  validates_presence_of :department, :area, :sub_area, :area_code




  def RemoveReferencesFromEmployees

    @employees = Employee.all

    @employees.each do |e|

      Employee.RemoveWorkReferences(self.id, e.id)
    end

  end

end
