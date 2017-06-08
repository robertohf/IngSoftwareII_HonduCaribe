namespace :contadores do
    task reset_monthly_permissions: :environment do
        Employee.update_all("monthly_permissions = 0");
    end

    task reset_annual_permissions: :environment do
        Employee.update_all("annual_permissions = 0");
    end
end