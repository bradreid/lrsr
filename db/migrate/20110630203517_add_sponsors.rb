class AddSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors, :force => true do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :url
      t.timestamps
    end
    
    add_index :sponsors, :name
  end

  def self.down
    remove_index :sponsors, :name
    drop_table :sponsors
  end
end