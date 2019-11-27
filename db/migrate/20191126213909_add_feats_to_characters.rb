class AddFeatsToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :lvl4feat, :string
    add_column :characters, :lvl8feat, :string
    add_column :characters, :lvl12feat, :string
    add_column :characters, :lvl16feat, :string
    add_column :characters, :lvl19feat, :string
  end
end
