module ArticlesHelper
  include ActsAsTaggableOn::TagsHelper

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(
      filter_html: Gorilla.markdown.filter_html,
      hard_wrap: Gorilla.markdown.hard_wrap
    )
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(text).html_safe
  end

  def selected_tag_name
    params[:q][:tags_name_eq]
  rescue
    nil
  end
end
