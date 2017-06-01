class CreateTrainingInstitutions < ActiveRecord::Migration
  def change
    create_table :training_institutions do |t|
      t.timestamps null: false
    end
  end
end
