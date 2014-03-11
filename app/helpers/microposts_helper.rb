module MicropostsHelper
  def post_of_current_user_or_current_user_admin?(micropost)
    micropost.user == current_user || (!current_user.nil? && current_user.admin)
  end
end
