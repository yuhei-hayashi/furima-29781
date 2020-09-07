class RenameAreaColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items , :area , :area_id
  end
end
