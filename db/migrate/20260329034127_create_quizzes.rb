class CreateQuizzes < ActiveRecord::Migration[8.1]
  def change
    create_table :quizzes do |t|
      t.text :question, null: false
      t.string :answer, null: false
      t.text :description, null: false
      t.jsonb :options, null: false

      t.timestamps
    end
  end
end
