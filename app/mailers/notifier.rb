class Notifier < ActionMailer::Base
  default :from => "noreply@lrsr.ca"
  
  def contact_request(contact_request, contact_request_email)
    recipients         "#{contact_request_email.name} <#{contact_request_email.email}>"
    from               "#{contact_request.name} <#{contact_request.email}>"
    headers "Reply-To" =>  "#{contact_request.name} <#{contact_request.email}>"    
    subject            "LRSR Contact Request: #{contact_request.subject}"
    body               contact_request.message
  end
  
end
