class AddSharedToNewsletters < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :shared, :timestamp
    add_index :newsletters, :shared
    Newsletter.update_all(:shared => true)
  end

  def self.down
    remove_index :newsletters, :shared
    remove_column :newsletters, :shared
  end
end