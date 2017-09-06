class AddPaperclipToConfigScreen < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :config_screens, :logo
  end
end
