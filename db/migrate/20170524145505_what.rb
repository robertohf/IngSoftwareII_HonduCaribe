class What < ActiveRecord::Migration
  def change
    add_attachment :employees, :image
  end
end
