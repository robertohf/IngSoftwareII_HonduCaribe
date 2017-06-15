class Education < ActiveRecord::Base
  belongs_to :employee
  mount_uploader :constancia, ConstanciaUploader
  validates_presence_of :school_name
end
