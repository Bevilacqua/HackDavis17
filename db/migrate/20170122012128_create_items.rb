class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :body
      t.string :image_url

      t.belongs_to :group

      t.timestamps
    end
  end
end
