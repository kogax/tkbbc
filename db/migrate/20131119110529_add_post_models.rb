class AddPostModels < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.timestamps
    end
    add_index :posts, :id
  end
end
