class CreateComents < ActiveRecord::Migration[5.1]
  def change
    create_table :coments do |t|
      t.references :item, foreign_key: true
      t.references :users, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
