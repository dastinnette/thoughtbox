class LinksController < ApplicationController

  def index
    @link = Link.new
  end

  def create
    link = Link.new(link_params)
    if link.save
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
