class CreateDadJokes < ActiveRecord::Migration[7.1]
  def change
    create_table :dad_jokes do |t|
      t.integer :cringe_level
      t.text :joke_text

      t.timestamps
    end
  end
end
