class AddLogoToConfigScreens < ActiveRecord::Migration[5.0]
  def up
    add_attachment :config_screens, :logo
  end
 
  def down
    remove_attachment :config_screens, :logo
  end
end
