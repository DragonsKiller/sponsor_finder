module IdeasHelper
  def get_url(idea)
    Rails.application.routes.url_helpers.api_v1_idea_url(idea, :host => "localhost:3001")
  end
end
