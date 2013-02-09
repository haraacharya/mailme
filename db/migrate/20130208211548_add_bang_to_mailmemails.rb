class AddBangToMailmemails < ActiveRecord::Migration
  def change
    add_column :mailmemails, :bang, :boolean
  end
end
