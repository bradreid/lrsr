class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events, :force => true do |t|
      t.string :name
      t.text :details
      t.string :location
      t.timestamp :start
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end