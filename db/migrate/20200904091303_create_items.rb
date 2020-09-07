class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name , null: false
      t.integer :price , null: false
      t.integer :status , null: false
      t.integer :delivery , null: false
      t.integer :area , null: false
      t.integer :day , null: false
      t.text :explanation , null: false
      t.references :user , null: false, foreign_key: true
      t.timestamps
    end
  end
end
