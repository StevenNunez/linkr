class HomeController < ApplicationController
  def index
    redirect_to short_links_path if signed_in?
  end
end
