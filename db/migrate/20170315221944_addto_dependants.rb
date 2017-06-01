class AddtoDependants < ActiveRecord::Migration
  def change
    add_column :dependants, :email, :string
    add_column :dependants, :phone, :string
    add_column :dependants, :birth_at, :date
  end
end
