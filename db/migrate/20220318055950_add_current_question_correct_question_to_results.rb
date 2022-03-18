class AddCurrentQuestionCorrectQuestionToResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :question, index: {name: 'current_question'}, foreign_key: true
    add_column :results, :correct_question, :integer, default: 0
  end
end
