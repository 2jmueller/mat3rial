class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :description
      t.string :category
      t.float :price
      t.string :location
      t.boolean :sold
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
