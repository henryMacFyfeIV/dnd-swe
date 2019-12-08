class CreateConcreteWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :concrete_weapons do |t|
      t.integer :count

      t.timestamps
    end
  end
end
