class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :nickname
  		t.string :email
  		t.string :name
  		t.string :first_name
  		t.string :last_name
  		t.string :image
  		t.string :urls
  		t.string :location
  		t.boolean :verified

  		t.timestamps
  	end
  end
end