class AddAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums, :force => true do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
    
    create_table :album_pictures, :force => true do |t|
      t.string :title
      t.integer :album_id
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"      
      t.timestamps
    end
    
    add_index :album_pictures, :album_id
  end

  def self.down
    drop_table :album_pictures
    drop_table :albums
  end
end