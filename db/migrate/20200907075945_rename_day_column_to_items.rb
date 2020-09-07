class RenameDayColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items , :day , :day_id
  end
end
