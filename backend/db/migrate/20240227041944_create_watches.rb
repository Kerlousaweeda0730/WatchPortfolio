class CreateWatches < ActiveRecord::Migration[7.1]
  def change
    create_table :watches do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :model
      t.string :price
      t.text :images
      t.string :movement

      t.timestamps
    end
  end
end
