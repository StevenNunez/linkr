class ShortLinksController < ApplicationController
  before_action :authenticate!, only: [:index, :new, :create]

  def new
    @short_link = ShortLink.new
  end

  def create
    short_link_params = params.require(:short_link).permit(:original_link)

    @short_link = current_user.short_links.new(short_link_params)
    if @short_link.save
      redirect_to @short_link, notice: "New Shortlink has been created"
    else
      render :new
    end
  end

  def index
    @short_links = current_user.short_links
  end

  def show
    if params[:short_code]
      @short_link = ShortLink.find_by(short_code: params[:short_code])
      redirect_to root_path, alert: "#{params[:short_code]} is not a valid Shortcode" unless @short_link
    else
      @short_link = ShortLink.find(params[:id])
    end
  end
end
