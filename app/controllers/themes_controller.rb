class ThemesController < ApplicationController
  protect_from_forgery except: :assets

  skip_before_filter :require_login

  def assets
    send_theme_file params[:filepath]
  end

  private

  def send_theme_file(filepath)
    full_path = "#{::Rails.root}/theme/#{Gorilla.theme_name}/assets/#{filepath}"

    return error404 if filepath.include?('..') || !File.file?(full_path)
    send_file(full_path, type: mime_type(filepath.split('.').last), disposition: :inline, stream: true)
  end

  def mime_type(extention)
    case extention

    ### Stylesheets and JavaScripts ###
    when 'css'
      'text/css'
    when 'js'
      'text/javascript'

    ### Images ###
    when 'jpg', 'jpeg'
      'image/jpeg'
    when 'png'
      'image/png'
    when 'gif'
      'image/gif'
    when 'svg', 'svgz'
      'image/svg+xml'

    ### Fonts ###
    when 'woff'
      'application/font-woff'
    when 'woff2'
      'application/font-woff2'
    when 'ttf'
      'application/x-font-ttf'
    when 'otf'
      'application/x-font-otf'
    when 'svgf'
      'image/svg+xml'
    when 'eot'
      'application/vnd.ms-fontobject'

    ### Others ###
    else
      'application/binary'
    end
  end
end
