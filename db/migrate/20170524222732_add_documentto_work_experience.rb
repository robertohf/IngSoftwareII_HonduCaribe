class AddDocumenttoWorkExperience < ActiveRecord::Migration
  def change
    add_attachment :educations, :document
    add_attachment :work_exps, :document
  end
end
