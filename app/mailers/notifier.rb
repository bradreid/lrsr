class Notifier < ActionMailer::Base
  default :from => "noreply@lrsr.ca"
  
  def contact_request(contact_request, contact_request_emails)
    recipients         contact_request_emails.map{|c| "#{c.name} <#{c.email}>"}.join(',')
    from               "#{contact_request.name} <#{contact_request.email}>"
    headers "Reply-To" =>  "#{contact_request.name} <#{contact_request.email}>"    
    subject            "LRSR Contact Request: #{contact_request.subject}"
    body               contact_request.message
  end
  
end
