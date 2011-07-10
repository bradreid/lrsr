class AddCachedWeather < ActiveRecord::Migration
  def self.up
    create_table :forcasts, :force => true do |t|
      t.text :raw_xml
      t.timestamps
    end
  end

  def self.down
    drop_table :forcasts
  end
end