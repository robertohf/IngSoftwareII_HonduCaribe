class AddStudyingToDependants < ActiveRecord::Migration[5.0]
  def change
    add_column :dependants, :studying, :boolean
  end
end
