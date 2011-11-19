class ContactRequest < ActiveRecord::Base
  validates_presence_of :name, :email, :subject, :message
  after_create :notify
  
  def notify
    Notifier.contact_request(self, ContactRequestEmail.all).deliver
  end
end
