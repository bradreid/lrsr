class AddFrontPageToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :front_page, :boolean
  end

  def self.down
    remove_column :articles, :front_page
  end
end
