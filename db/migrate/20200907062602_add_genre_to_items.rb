class AddGenreToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :genre, :integer
  end
end
