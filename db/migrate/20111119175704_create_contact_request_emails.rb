class CreateContactRequestEmails < ActiveRecord::Migration
  def self.up
    create_table :contact_request_emails, :force => true do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :contact_request_emails
  end
end