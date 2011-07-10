class AddNewsLetters < ActiveRecord::Migration
  def self.up
    create_table :newsletters, :force => true do |t|
      t.string :name
      t.string :newsletter_file_name
      t.string :newsletter_content_type
      t.integer :newsletter_file_size
      t.datetime :newsletter_updated_at 
      t.timestamps
    end
  end

  def self.down
    drop_table :news_letters
  end
end