class CreateConcreteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :concrete_items do |t|
      t.integer :count

      t.timestamps
    end
  end
end
