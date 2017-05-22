class AddProviderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uuid, :string
    add_index :users, :uuid
  end
end
