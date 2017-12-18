require 'erb'

class ShowExceptions
  PREVIEW_SIZE = 7
  attr_reader :app
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue Exception => e
      ['500', {'Content-type' => 'text/html'},
         ['RuntimeError',render_exception(e)]]
    end
  end

  private

  def render_exception(e)
    preview = render_preview(e.backtrace_locations.first)
    template_file = File.open("#{File.expand_path('')}/lib/templates/rescue.html.erb")
    template_contents = template_file.read
    template_file.close
    ERB.new(template_contents).result(binding)
  end

  def render_preview(trace_location)
    preview_start = trace_location.lineno - PREVIEW_SIZE
    preview_start = 0 if preview_start < 0
    preview = ""
    File.open(trace_location.absolute_path).each.with_index do |line, i|
      break if i > trace_location.lineno
      preview << line if i >= preview_start
    end
    preview
  end
end
