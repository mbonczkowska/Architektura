class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :author
      t.string :album
      t.integer :year
      t.integer :length

      t.timestamps
    end
  end
end
