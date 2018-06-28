module IdeasHelper
  def get_url(idea)
    Rails.application.routes.url_helpers.idea_url(idea, :host => "localhost:3000")
  end
end
