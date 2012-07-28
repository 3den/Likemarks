class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :message
      t.string :picture
      t.string :link
      t.string :name
      t.string :icon
      t.timestamp :created_time

      t.timestamps
    end

    add_index :links, :link, unique: true
  end
end
