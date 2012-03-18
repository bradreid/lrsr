class AddUserUpdateAtToTrailConditions < ActiveRecord::Migration
  def self.up
    add_column :trail_conditions, :user_updated_at, :datetime
  end

  def self.down
    remove_column :trail_conditions, :user_updated_at
  end
end
