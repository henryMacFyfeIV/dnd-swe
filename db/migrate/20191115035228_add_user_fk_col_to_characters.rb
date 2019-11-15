class AddUserFkColToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :users, foreign_key: true
  end
end
