module UsersHelper

  def gravatar_for(user, options = { size: 24 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{options[:size]}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def he_is_god?(user)
    user.admin ? 'Oh yeah!' : 'No, but close to it'
  end
end
