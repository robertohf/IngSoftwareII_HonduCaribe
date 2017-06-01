class CreateWorkExps < ActiveRecord::Migration
  def change
    create_table :work_exps do |t|
      t.string :company_name
      t.datetime :year_start
      t.datetime :year_end
      t.text :position

      t.timestamps null: false
    end
  end
end
