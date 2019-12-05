class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :cost
      t.integer :weight
      t.string :properties

      t.timestamps
    end
  end
end
