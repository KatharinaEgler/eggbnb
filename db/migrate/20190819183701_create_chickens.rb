class CreateChickens < ActiveRecord::Migration[5.2]
  def change
    create_table :chickens do |t|
      t.string :name
      t.integer :age
      t.integer :price
      t.integer :egg_volume
      t.string :egg_color
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
