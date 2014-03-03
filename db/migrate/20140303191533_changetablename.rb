class Changetablename < ActiveRecord::Migration
  def change
  	rename_column :votes, :user_id_id, :user_id
  	rename_column :votes, :question_id_id, :question_id
  end
end
