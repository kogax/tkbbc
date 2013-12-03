class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :board_id
  end
end
