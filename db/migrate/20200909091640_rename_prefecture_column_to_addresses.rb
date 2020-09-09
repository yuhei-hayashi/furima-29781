class RenamePrefectureColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefecture, :area_id
  end
end
