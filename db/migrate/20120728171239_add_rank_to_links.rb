class AddRankToLinks < ActiveRecord::Migration
  def change
    add_column :links, :rank, :integer, null: false, default: 0
    add_index :links, :rank
  end
end
