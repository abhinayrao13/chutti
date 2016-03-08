module DeviseHelper
  # over writing devise method
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

  # modified version of devise_error_messages which takes resource and form field as input to display error messages
  def error_messages!(resource, field)
    if resource.errors[field].empty?
      return ""
    else
      error = "#{field.to_s.titleize} : #{resource.errors[field][0]}"
      return error
    end
  end

end
