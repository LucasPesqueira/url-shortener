class UrlLinksController < ApplicationController

  def index
    @url_links = current_user.url_links.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def create
    if UrlLink.create(user: current_user, original_url: permitted_params[:original_url])
      redirect_to :url_links
    end
  end

  def link_redirect
    byebug
  end

  private

  def permitted_params
    params.require(:url_link).permit(:original_url)
  end
end
