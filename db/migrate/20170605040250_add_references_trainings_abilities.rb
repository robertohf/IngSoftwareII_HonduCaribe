class AddReferencesTrainingsAbilities < ActiveRecord::Migration
  def change
    add_reference :training_abilities, :ability, index: true, foreign_key: true
    add_reference :training_abilities, :training, index: true, foreign_key: true
  end
end
