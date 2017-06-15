class WorkExp < ActiveRecord::Base
  belongs_to :employee
  mount_uploader :constancia, ConstanciaUploader
  validates_presence_of :company_name, :year_start, :year_end
end
