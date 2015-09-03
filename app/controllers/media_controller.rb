class MediaController < ApplicationController
  before_filter :require_user, except: :index

  def index
    @media = Media.newest_first
  end

  def new
    @media = Media.new
  end

  def create
    @media = Media.new(media_params)
    @media.user = current_user

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