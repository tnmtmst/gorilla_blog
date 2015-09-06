class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login
  before_action :set_views_path, :set_tags
  layout :set_layout

  # Error handling
  if Rails.env.production?
    rescue_from Exception,                      with: :error500
    rescue_from ActiveRecord::RecordNotFound,   with: :error404
    rescue_from ActionController::RoutingError, with: :error404
  end

  def error404(e = nil)
    render 'errors/404', status: 404, formats: [:html]
  end

  def error500(e = nil)
    logger.error [e, *e.backtrace].join("\n")
    render 'errors/500', status: 500, formats: [:html]
  end

  private

  def set_views_path
    prepend_view_path "#{::Rails.root}/theme/#{Settings.theme_name}/views"
  end

  def set_layout
    "#{::Rails.root}/theme/#{Settings.theme_name}/views/layouts/application"
  end

  def set_tags
    @tags = Article.tag_counts_on(:tags).order(taggings_count: 'DESC')
  end

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
