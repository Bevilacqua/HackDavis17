class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :uid    
      t.timestamps
    end
  end
end
