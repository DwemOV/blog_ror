class AddUserToItem < ActiveRecord::Migration[5.1]
  def up
    add_reference :items, :users, foreign_key: true
  end

  def down
    remove_reference :items, :user, :references , foreign_key: true

  end
end
