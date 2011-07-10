class AddContactRequest < ActiveRecord::Migration
  def self.up
    create_table :contact_requests, :force => true do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.boolean :received, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :contact_requests
  end
end