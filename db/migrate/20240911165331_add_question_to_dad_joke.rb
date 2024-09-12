class AddQuestionToDadJoke < ActiveRecord::Migration[7.1]
  def change
    add_column :dad_jokes, :question, :text
  end
end
