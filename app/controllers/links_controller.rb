class LinksController < ApplicationController
  before_action :authorize!

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to root_path
    else
      @links = current_user.links
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
