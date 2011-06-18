class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :autor, default:'anonim'
      t.text :body
      t.timestamps
    end
    
    create_table :answers do |t|
			t.references :question
			t.text :body
			t.timestamps
		end
  end

  def self.down
    drop_table :answers
    drop_table :questions
  end
end
