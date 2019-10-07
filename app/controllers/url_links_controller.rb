class UrlLinksController < ApplicationController

  def index
    @url_links = current_user.url_links
  end

  def create
  end

  private

  def permitted_params
    params.require(:url_link).permit(:original_url)
  end
end
