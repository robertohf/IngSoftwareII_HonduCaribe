class EmployeeFields < ActiveRecord::Migration
  def change
    add_column :employees, :last_work, :string
    add_column :employees, :email, :string
    add_column :employees, :RAP_code, :string
    add_column :employees, :cellphone, :integer
    add_column :employees, :bank_account, :integer
    add_column :employees, :contract_type, :string
    add_column :employees, :gender, :string
    add_column :employees, :employee_status, :boolean
    add_column :employees, :supression_motive, :string
    add_column :employees, :supression_date, :datetime
    add_column :employees, :identity_number, :string
    remove_column :employees, :position
    remove_column :employees, :number_id
  end
end
