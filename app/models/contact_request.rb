class ContactRequest < ActiveRecord::Base
  validates_presence_of :name, :email, :subject, :message
  after_create :notify
  
private

  def notify
    ContactRequestEmail.all do |c|
      Notifier.contact_request(self, c).deliver
    end
  end
end
