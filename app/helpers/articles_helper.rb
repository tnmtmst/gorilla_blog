module ArticlesHelper
  include ActsAsTaggableOn::TagsHelper

  def selected_tag_name
    params[:q][:tags_name_eq]
  rescue
    nil
  end
end
