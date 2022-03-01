class CreateLenses < ActiveRecord::Migration[6.1]
  def change
    create_table :lenses do |t|
      t.string :color
      t.text :description
      t.string :prescription_type
      t.string :lens_type
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end
