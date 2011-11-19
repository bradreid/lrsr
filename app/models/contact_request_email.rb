class ContactRequestEmail < ActiveRecord::Base
  validates_presence_of :name, :email
end
