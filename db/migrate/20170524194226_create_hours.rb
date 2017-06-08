class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer  :employee_id
      t.datetime :time_in
      t.datetime :time_out
    end
  end
end
