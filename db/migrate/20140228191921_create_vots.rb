class CreateVots < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.belongs_to :user_id
    	t.belongs_to :question_id
    	t.integer :vote
    	t.timestamps
    end
  end
end
