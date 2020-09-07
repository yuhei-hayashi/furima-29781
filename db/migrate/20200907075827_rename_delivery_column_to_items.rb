class RenameDeliveryColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items , :delivery , :delivery_id
  end
end
