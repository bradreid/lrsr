class LrsrFormBuilder < ActionView::Helpers::FormBuilder 
  def error_messages(opts={})
    errors = []
    errors += object.errors.full_messages unless object.errors.empty?
    errors += opts[:errors] unless opts[:errors].blank?
    return if errors.empty?
    @template.content_tag(:div, :class => 'form_errors', :onclick => "toggle_error_messages();" ) do
      @template.content_tag(:h3, "Sorry, there #{object.errors.size == 1 ? 'is' : 'are'} #{@template.pluralize(errors.size, 'error')} with your form") +
      # @template.content_tag(:ul, :style => 'display:none') do
      @template.content_tag(:ul) do      
        errors.map{|msg| @template.content_tag(:li, msg) }.join(' ').html_safe
      end
    end
  end
end
