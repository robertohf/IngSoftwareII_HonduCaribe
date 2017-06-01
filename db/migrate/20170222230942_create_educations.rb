class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school_name
      t.datetime :year_start
      t.datetime :year_end
      t.boolean :completed
      t.text :title_description

      t.timestamps null: false
    end
  end
end
