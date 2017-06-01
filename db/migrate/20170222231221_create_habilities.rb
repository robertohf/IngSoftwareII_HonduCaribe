class CreateHabilities < ActiveRecord::Migration
  def change
    create_table :habilities do |t|
      t.string :hability

      t.timestamps null: false
    end
  end
end
