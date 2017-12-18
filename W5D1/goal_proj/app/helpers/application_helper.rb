module ApplicationHelper
  def auth_token
    <<-html
      <input type="hidden" value="#{form_authenticity_token}"
        name="authenticity_token">
    html
    .html_safe
  end
end
