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
end
