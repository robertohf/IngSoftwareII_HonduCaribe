class Training < ActiveRecord::Base
  has_many :training_employees
  has_many :employees, through: :training_employees

  belongs_to :institution

  def self.categories
    %w[Capacitacion Charla Seminario Taller]
  end
end
