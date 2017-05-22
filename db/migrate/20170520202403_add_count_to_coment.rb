class AddCountToComent < ActiveRecord::Migration[5.1]
  def change
    add_column :coments, :likers_count, :integer, :default => 0
    add_column :items, :likers_count, :integer, :default => 0
  end
end
