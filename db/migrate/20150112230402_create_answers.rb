class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.text :content
      t.references :question, index: true

      t.timestamps null: false
    end
      add_index :answers, [:question_id, :created_at]
  end
end
