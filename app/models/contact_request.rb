class ContactRequest < ActiveRecord::Base
  validates_presence_of :name, :email, :subject, :message
  after_create :notify
  
  def notify
    ContactRequestEmail.all.each do |c|
      Notifier.contact_request(self, c).deliver
    end
  end
end
