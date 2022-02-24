class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.integer :test_id
      t.references :test_id, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
