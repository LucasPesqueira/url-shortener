class HomeController < ApplicationController

  def index
    @current_user = current_user
    if params[:hash].present?
      @url_link = UrlLink.find_by(shortened_url: "#{ENV['ROOT_URL']}#{params[:hash]}")
      if @url_link.present?
        redirect_to get_redirect_url(@url_link)
      else
        render :file => "public/404.html", status: 404
      end
    end
  end

  private

  def get_redirect_url(url_link)
    url = URI.parse url_link.original_url
    if url.scheme.present?
      url
    else
      "http://#{url_link.original_url}"
    end
  end
end
