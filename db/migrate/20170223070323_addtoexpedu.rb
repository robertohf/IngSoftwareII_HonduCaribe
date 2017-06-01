class Addtoexpedu < ActiveRecord::Migration
  def change
    add_column :educations, :constancia, :string
    add_column :work_exps, :constancia, :string
  end
end
