class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    if link.save
      current_user.links << link
      flash[:notice] = "Link was created."
    else
      flash[:errors] = "Invalid. Try again."
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
