class ContactRequest < ActiveRecord::Base
  validates_presence_of :name, :email, :subject, :message
end
