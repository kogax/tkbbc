class AddBoardModels < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.timestamps
    end
    add_index :boards, :id
  end
end
