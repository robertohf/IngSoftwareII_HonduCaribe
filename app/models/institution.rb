class Institution < ActiveRecord::Base
  has_many :trainings
  has_many :instructors
end
