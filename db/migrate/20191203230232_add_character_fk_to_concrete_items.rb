class AddCharacterFkToConcreteItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :concrete_items, :character, foreign_key: true
    add_reference :concrete_items, :item, foreign_key: true
  end
end
