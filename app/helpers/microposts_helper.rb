module MicropostsHelper
  def post_of_current_user_or_current_user_admin?(micropost)
    micropost.user == current_user || (!current_user.nil? && current_user.admin)
  end

  def micropost_categories(micropost)
    micropost.categories.map do |category|
      content_tag(:span,'', class: "pictonic-icon icon-#{ category.icon }") +
          link_to(category.name, microposts_path(category: category.id), remote: true)
    end.join(', ').html_safe
  end
end
