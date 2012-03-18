class AddTweetsTable < ActiveRecord::Migration
  def self.up
    create_table :twitter_feeds, :force => true do |t|
      t.text :text
      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_feeds
  end
end