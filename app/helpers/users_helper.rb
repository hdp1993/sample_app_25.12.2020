module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url_2 = "https://vi.gravatar.com/userimage/195052400/abe01fd2c723f2d4ad7a1e405bad6635.jpg?size=#{size}"
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url_2, alt: user.name, class: "gravatar")
  end
end
