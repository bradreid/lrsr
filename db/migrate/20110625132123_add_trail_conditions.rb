class AddTrailConditions < ActiveRecord::Migration
  def self.up
    create_table :trail_conditions, :force => true do |t|
      t.string :trail_name
      t.string :status
      t.text :details
      t.integer :updated_by_id
      t.timestamps
    end
    TrailCondition.create!(:trail_name => 'Club Trails', :status => 'closed_for_season', :updated_by => User.system_user, :details => 'migration details')
  end

  def self.down
    drop_table :trail_conditions
  end
end