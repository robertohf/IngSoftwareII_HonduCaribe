class AddSchedule < ActiveRecord::Migration
  def change
    add_column :employees, :scheduletype, :string
  end
end
