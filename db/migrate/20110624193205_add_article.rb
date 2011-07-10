class AddArticle < ActiveRecord::Migration
  def self.up
    create_table :articles, :force => true do |t|
      t.string :title
      t.integer :created_by_id
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end