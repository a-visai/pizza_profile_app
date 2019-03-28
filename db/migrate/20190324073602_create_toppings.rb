class CreateToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :toppings do |t|
      t.integer :pizza_id
      t.string :protein
      t.string :cheese
      t.string :sauce
      t.string :extras

      t.timestamps
    end
  end
end
