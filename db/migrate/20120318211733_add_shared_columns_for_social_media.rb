class AddSharedColumnsForSocialMedia < ActiveRecord::Migration
  def self.up
    add_column :articles, :shared, :datetime
    add_column :trail_conditions, :shared, :datetime
    add_column :events, :shared, :datetime
    add_column :events, :shared_before, :datetime
    add_index :articles, :shared
    add_index :events, :shared
    Article.update_all(:shared => Time.now)
    Event.update_all(:shared => Time.now)
    
  end

  def self.down
    remove_column :events, :shared_before
    remove_index :events, :shared
    remove_index :articles, :shared
    remove_column :events, :shared
    remove_column :trail_conditions, :shared
    remove_column :articles, :shared
  end
end