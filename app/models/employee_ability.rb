class EmployeeAbility < ActiveRecord::Base
  belongs_to :employee
  belongs_to :ability
end
