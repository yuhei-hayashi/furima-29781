class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string :post_code , null: false
      t.integer :prefecture , null: false
      t.string :city , null: false
      t.string :house_number , null: false
      t.string :building
      t.string :telephone , null: false
      t.references :order ,null: false , foreighn_key: true
      t.timestamps
    end
  end
end
