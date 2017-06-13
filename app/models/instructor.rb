class Instructor < ActiveRecord::Base
  belongs_to :institution
  validates_presence_of :name
end
