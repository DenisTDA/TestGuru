class CreateAchivements < ActiveRecord::Migration[5.2]
  def change
    create_table :achivements do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
