class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :name
    	t.integer :kudos
    	t.integer :views
    	
    	t.timestamps
    end
  end
end
