class ThemeGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  attr_reader :plugin_name, :plugin_path

  def initialize(*args)
    super
    @plugin_name = file_name.underscore
    @plugin_path = "theme/#{plugin_name}"
  end

  def copy_templates
    empty_directory "#{plugin_path}/views"
    empty_directory "#{plugin_path}/views/layouts"
    empty_directory "#{plugin_path}/views/articles"
    empty_directory "#{plugin_path}/views/user_sessions"
    empty_directory "#{plugin_path}/views/users"
    empty_directory "#{plugin_path}/assets"
    empty_directory "#{plugin_path}/assets/stylesheets"
    empty_directory "#{plugin_path}/assets/javascripts"
  end
end
