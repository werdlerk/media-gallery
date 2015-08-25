class MediaController < ApplicationController

  def index
    @media = Media.all
  end

  def new
    @media = Media.new
  end

  def create
    @media = Media.new(media_params)
    @media.user = User.first

    if @media.save
      flash[:success] = "Media uploaded"
      redirect_to media_index_path
    else
      render :new
    end
  end

  private

  def media_params
    params.require(:media).permit(:url)
  end

end