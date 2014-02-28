class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :text
    	t.date :date
    	t.timestamps
    end
  end
end
