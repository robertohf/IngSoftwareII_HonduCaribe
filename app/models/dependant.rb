class Dependant < ActiveRecord::Base
  belongs_to :employee
  validates_presence_of :name, :relation
end
