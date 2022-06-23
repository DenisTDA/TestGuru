class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :picture, null: false
      t.references :rule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
