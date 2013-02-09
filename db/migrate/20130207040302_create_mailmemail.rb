class CreateMailmemail < ActiveRecord::Migration
  
  def change
  	create_table :mailmemails do |t|
  		
  		t.integer :user_id
  		t.integer :sendto
  		t.string :subject
  		t.text :content

  		t.timestamps
  	end
  end

end
