class AddCharacterFkToConcreteWeapon < ActiveRecord::Migration[6.0]
  def change
    add_reference :concrete_weapons, :character, foreign_key: true
    add_reference :concrete_weapons, :weapon, foreign_key: true
  end
end
