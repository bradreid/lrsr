class AddWinnipegWeatherToForcast < ActiveRecord::Migration
  def self.up
    add_column :forcasts, :winnipeg, :text
  end

  def self.down
    remove_column :forcasts, :winnipeg
  end
end
