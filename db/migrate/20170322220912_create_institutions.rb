class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :phone

      t.timestamps null: false
    end
  end
end
