class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false 
      t.integer :level, default: 0
      t.integer :category_id
      t.integer :user_id
      t.references :category_id, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
