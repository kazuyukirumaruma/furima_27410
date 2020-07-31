class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                     null: false
      t.text :explanation,                null: false
      t.integer :category_id,             null: false
      t.integer :commodity_condition_id,  null: false
      t.integer :shipping_charges_id,     null: false
      t.integer :region_id,               null: false
      t.integer :shipping_days_id,        null: false
      t.integer :price,                   null: false
      # t.references :comment,            null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true

      t.timestamps                      null: false
    end
  end
end
