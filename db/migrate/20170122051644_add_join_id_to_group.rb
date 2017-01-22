class AddJoinIdToGroup < ActiveRecord::Migration[5.0]
  def change
  	add_column :groups, :join_id, :string
  end
end
