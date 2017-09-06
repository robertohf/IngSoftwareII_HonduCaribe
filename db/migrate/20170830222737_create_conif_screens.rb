class CreateConifScreens < ActiveRecord::Migration[5.0]
  def change
    create_table :conif_screens do |t|
      t.string :compania
      t.text :mision
      t.text :vision

      t.timestamps
    end
  end
end
