class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link
    else
    end
    redirect_to links_path
  end

  def edit
    @link = Link.find(params["id"])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to links_path
    else
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
