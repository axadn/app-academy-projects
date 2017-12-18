require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require 'byebug'
require_relative './flash'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params, :session, :flash
  # Setup the controller
  def initialize(req, res, params ={})

    @params = params
    @req = req
    @res = res
    @already_built_response = false
    @session = Session.new(req)
    @flash = Flash.new(req)
  end

  def invoke_action(name)
    send(name)
    render(name) unless already_built_response?
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "double render" if already_built_response?
    res.status = 302
    res.header["location"] = url
    session.store_session(res)
    flash.store_flash(res)
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "double render" if already_built_response?
    res.header['Content-Type'] = content_type
    res.write(content)
    res.finish
    session.store_session(res)
    flash.store_flash(res)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    template_path = <<-string
      #{File.expand_path("")}/
      views/#{self.class.name.underscore}/
        #{template_name}.html.erb
        string
          .delete!("\n").delete!(" ")
    template_file = File.open(template_path)
    template_contents = template_file.read
    template_file.close
    erb_result = ERB.new(template_contents).result(binding)
    render_content(erb_result, "text/html")
  end
end
